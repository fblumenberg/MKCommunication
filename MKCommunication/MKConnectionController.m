// ///////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2010, Frank Blumenberg
//
// See License.txt for complete licensing and attribution information.
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// ///////////////////////////////////////////////////////////////////////////////


#import "MKConnectionController.h"
#import "NSData+MKCommandDecode.h"
#import "NSData+MKCommandEncode.h"
#import "NSData+MKPayloadDecode.h"
#import "MKDataConstants.h"
#import "MKIpConnection.h"

#import "IKDeviceVersion.h"
#import "IKParamSet.h"
#import "IKPoint.h"

#import <CocoaLumberjack/CocoaLumberjack.h>

//#import "MKTConnection.h"
//#import "MKTConnection+MKConnection.h"

// ///////////////////////////////////////////////////////////////////////////////
NSString *const MKFoundDeviceNotification = @"MKFoundDeviceNotification";
NSString *const MKDeviceChangedNotification = @"MKDeviceChangedNotification";
NSString *const MKConnectedNotification = @"MKConnectedNotification";
NSString *const MKProbeMkNotification = @"MKProbeMkNotification";
NSString *const MKDisconnectedNotification = @"MKDisconnectedNotification";
NSString *const MKDisconnectErrorNotification = @"MKDisconnectErrorNotification";

NSString *const MKVersionNotification = @"MKVersionNotification";
NSString *const MKDebugDataNotification = @"MKDebugDataNotification";
NSString *const MKDebugLabelNotification = @"MKDebugLabelNotification";
NSString *const MKLcdMenuNotification = @"MKLcdMenuNotification";
NSString *const MKLcdNotification = @"MKLcdNotification";
NSString *const MKReadSettingNotification = @"MKReadSettingNotification";
NSString *const MKWriteSettingNotification = @"MKWriteSettingNotification";
NSString *const MKChangeSettingNotification = @"MKChangeSettingNotification";

NSString *const MKChannelValuesNotification = @"MKChannelValuesNotification";

NSString *const MKReadMixerNotification = @"MKReadMixerNotification";
NSString *const MKWriteMixerNotification = @"MKWriteMixerNotification";

NSString *const MKOsdNotification = @"MKOsdNotification";
NSString *const MKData3DNotification = @"MKData3DNotification";

NSString *const MKReadPointNotification = @"MKReadPointNotification";
NSString *const MKWritePointNotification = @"MKWritePointNotification";

NSString *const MKMotorDataNotification = @"MKMotorDataNotification";


// ///////////////////////////////////////////////////////////////////////////////

#define kConnectionStateIdle 0
#define kConnectionStateWaitNC 1
#define kConnectionStateWaitFC 2
#define kConnectionStateWaitNC_2 3
#define kConnectionStateWaitMK3MAG 4
#define kConnectionDeviceChecked 5


///////////////////////////////////////////////////////////////////////////////
#pragma mark - DDRegisteredDynamicLogging
static int ddLogLevel = LOG_LEVEL_WARN;

@interface MKConnectionController (DDRegisteredDynamicLogging) <DDRegisteredDynamicLogging>
@end

@implementation MKConnectionController (DDRegisteredDynamicLogging)
+ (int)ddLogLevel {
  return ddLogLevel;
}

+ (void)ddSetLogLevel:(int)logLevel {
  ddLogLevel = logLevel;
}
@end
///////////////////////////////////////////////////////////////////////////////

// ///////////////////////////////////////////////////////////////////////////////
@interface MKConnectionController () {

  NSInteger connectionState;
  NSInteger retryCount;
  BOOL didPostConnectNotification;

  IKMkAddress primaryDevice;
  IKMkAddress currentDevice;

  IKDeviceVersion *versions[3];
}

- (void)handleMkResponse:(MKCommandId)command
             withPayload:(NSData *)payload
              forAddress:(IKMkAddress)address;

- (void)handleMkResponseForDeviceCheck:(MKCommandId)command
                           withPayload:(NSData *)payload
                            forAddress:(IKMkAddress)address;

- (void)clearVersions;
- (void)setVersion:(IKDeviceVersion *)v;
- (void)requestDeviceVersion;
- (void)nextConnectAction;

@end

// ///////////////////////////////////////////////////////////////////////////////

@implementation MKConnectionController

// -------------------------------------------------------------------------------

@synthesize hostOrDevice = _hostOrDevice;
@synthesize inputController = _inputController;

@synthesize primaryDevice;
@synthesize currentDevice;

+ (MKConnectionController *)sharedMKConnectionController {
  static dispatch_once_t once;
  static MKConnectionController *sharedMKConnectionController__ = nil;

  dispatch_once(&once, ^{
    sharedMKConnectionController__ = [[MKConnectionController alloc] init];
  });

  return sharedMKConnectionController__;
}

// -------------------------------------------------------------------------------

- (void)dealloc {

  self.hostOrDevice = nil;
  self.inputController = nil;
  [self clearVersions];
}

// -------------------------------------------------------------------------------

- (void)start:(NSDictionary*)host {

  if (![self.inputController isConnected]) {

    NSString* className = [host objectForKey:@"connectionClass"];
    Class nsclass =    NSClassFromString(className);
    NSAssert(nsclass, @"Unknown conneciton class %@", className);
    if (!nsclass) {
      nsclass = [MKIpConnection class];
    }

    self.inputController = [[nsclass alloc] initWithDelegate:self];

    self.hostOrDevice = host;

    didPostConnectNotification = NO;

    currentDevice = kIKMkAddressAll;
    primaryDevice = kIKMkAddressAll;
    connectionState = kConnectionStateIdle;

    if (![self.inputController connectTo:host]) {
      [self performSelector:@selector(fail) withObject:self afterDelay:0.1];
    }
  }
}

- (void)fail {
    DDLogVerbose(@"Failed, disconnect");
    [self didDisconnect];
}

- (void)stop {
  if ([self.inputController isConnected]) {
    DDLogVerbose(@"disconnect");
    [self.inputController disconnect];
  }
}

- (BOOL)isRunning; {
  return [self.inputController isConnected];
}

- (void)sendRequest:(NSData *)data; {
//  DDLogVerbose(@"%@", data);
  DDLogVerbose(@"Send request%@", [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]);

  [self.inputController writeMkData:data];
}

- (IKDeviceVersion *)versionForAddress:(IKMkAddress)theAddress; {
  if (theAddress <= kIKMkAddressAll || theAddress > kIKMkAddressMK3MAg)
    return nil;
  
  for(int i=0;i<3;i++)
    NSLog(@"Version %d - %@",i,versions[i]);
  
  return versions[theAddress - 1];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -

///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)hasNaviCtrl {
  return versions[kIKMkAddressNC - 1] != nil;
}

- (BOOL)hasFlightCtrl {
  return versions[kIKMkAddressFC - 1] != nil;
}

- (BOOL)hasMK3MAG {
  return versions[kIKMkAddressMK3MAg - 1] != nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)resetToNC{
  DDLogVerbose(@"Activate the NaviControl");
  uint8_t bytes[5];
  bytes[0] = 0x1B;
  bytes[1] = 0x1B;
  bytes[2] = 0x55;
  bytes[3] = 0xAA;
  bytes[4] = 0x00;
  
  NSData *data = [NSData dataWithBytes:&bytes length:5];
  [self sendRequest:data];
}

- (void)activateNaviCtrl {

  [self resetToNC];
  [self performSelector:@selector(resetToNC) withObject:self afterDelay:0.1];

  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.5];
  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.7];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)activateFlightCtrl {

  DDLogVerbose(@"Activate the FlightCtrl");

  uint8_t byte = 0;
  NSData *data = [NSData dataWithCommand:MKCommandRedirectRequest
                              forAddress:kIKMkAddressNC
                          payloadForByte:byte];

  [self sendRequest:data];
  [self sendRequest:data];
  
  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.5];
  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.8];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)activateMK3MAG {

  //  if(![self hasNaviCtrl])
  //    return;

  DDLogVerbose(@"Activate the MK3MAG");

  uint8_t byte = 1;
  NSData *data = [NSData dataWithCommand:MKCommandRedirectRequest
                              forAddress:kIKMkAddressNC
                          payloadForByte:byte];

  [self sendRequest:data];
  [self sendRequest:data];

  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.1];
  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.2];
  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.3];
  [self performSelector:@selector(requestDeviceVersion) withObject:self afterDelay:0.4];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)activateMKGPS {

  if (![self hasNaviCtrl])
    return;

  uint8_t byte = 3;
  NSData *data = [NSData dataWithCommand:MKCommandRedirectRequest
                              forAddress:kIKMkAddressNC
                          payloadForByte:byte];

  [self sendRequest:data];
  currentDevice = kIKMkAddressMKGPS;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestSettingForIndex:(NSInteger)theIndex {
  uint8_t index = (uint8_t)theIndex;

  NSData *data = [NSData dataWithCommand:MKCommandReadSettingsRequest
                              forAddress:kIKMkAddressFC
                        payloadWithBytes:&index
                                  length:1];

  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setActiveSetting:(NSUInteger)newActiveSetting {
  uint8_t index = (uint8_t)newActiveSetting;
  NSData *data = [NSData dataWithCommand:MKCommandChangeSettingsRequest
                              forAddress:kIKMkAddressFC
                        payloadWithBytes:&index
                                  length:1];

  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)saveSetting:(IKParamSet *)setting {

  NSData *payload = [setting data];
  NSData *data = [payload dataWithCommand:MKCommandWriteSettingsRequest
                               forAddress:kIKMkAddressFC];
  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestData3DForInterval:(NSUInteger)interval {
  uint8_t iv = (uint8_t)interval;
  NSData *data = [NSData dataWithCommand:MKCommandData3DRequest
                              forAddress:kIKMkAddressAll
                        payloadWithBytes:&iv
                                  length:1];

  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDebugValueForInterval:(NSUInteger)interval {
  uint8_t iv = (uint8_t)interval;
  NSData *data = [NSData dataWithCommand:MKCommandDebugValueRequest
                              forAddress:kIKMkAddressAll
                        payloadWithBytes:&iv
                                  length:1];

  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestMotorDataForInterval:(NSUInteger)interval {
  uint8_t iv = (uint8_t)interval;
  NSData *data = [NSData dataWithCommand:MKCommandMotorDataRequest
                              forAddress:kIKMkAddressAll
                        payloadWithBytes:&iv
                                  length:1];

  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestOsdDataForInterval:(NSUInteger)interval {
  uint8_t iv = (uint8_t)interval;
  NSData *data = [NSData dataWithCommand:MKCommandOsdRequest
                              forAddress:kIKMkAddressNC
                        payloadWithBytes:&iv
                                  length:1];

  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestPointForIndex:(NSInteger)theIndex {
  uint8_t index = (uint8_t)theIndex;

  NSData *data = [NSData dataWithCommand:MKCommandReadPointRequest
                              forAddress:kIKMkAddressNC
                        payloadWithBytes:&index
                                  length:1];

  [self sendRequest:data];
}

- (void)writePoint:(IKPoint *)point {

  NSData *payload = [point data];
  NSData *data = [payload dataWithCommand:MKCommandWritePointRequest
                               forAddress:kIKMkAddressNC];
  [self sendRequest:data];
}

- (void)sendPoint:(IKPoint *)point {

  NSData *payload = [point data];
  NSData *data = [payload dataWithCommand:MKCommandSendPointRequest
                               forAddress:kIKMkAddressNC];
  [self sendRequest:data];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MKInputDelegate


- (void)didConnectTo:(NSString *)hostOrDevice {
  NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
  [nc postNotificationName:MKProbeMkNotification object:self userInfo:nil];

  [self nextConnectAction];
}

- (void)willDisconnectWithError:(NSError *)err {
  NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:err, @"error", nil];

  NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];

  [nc postNotificationName:MKDisconnectErrorNotification object:self userInfo:d];
}

- (void)didDisconnect {
  [self clearVersions];

  NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
  [nc postNotificationName:MKDisconnectedNotification object:self userInfo:nil];

}

- (void)didReadMkData:(NSData *)data {

  NSData *strData = [data subdataWithRange:NSMakeRange(0, [data length] - 1)];
//  DDLogVerbose(@">>%@<<", [[NSString alloc] initWithData:strData encoding:NSASCIIStringEncoding]);

  if ([strData isCrcOk]) {
    //    DDLogVerbose(@"Data length %d",[strData length]);

    NSData *payload = [strData payload];
    IKMkAddress address = [strData address];
//    if (address!=currentDevice) {
//      currentDevice=address;
//      DDLogVerbose(@"Device changed to %d, send notification",currentDevice);
//      [[NSNotificationCenter defaultCenter] postNotificationName:MKDeviceChangedNotification 
//                                                          object:self 
//                                                        userInfo:nil];
//    }

    if (connectionState == kConnectionDeviceChecked)
      [self handleMkResponse:[data command] withPayload:payload forAddress:address];
    else
      [self handleMkResponseForDeviceCheck:[data command] withPayload:payload forAddress:address];

  } else {
    DDLogVerbose(@"%@", [[NSString alloc] initWithData:strData encoding:NSASCIIStringEncoding]);
  }
}

//////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - MKConnectionController (private)

- (void)clearVersions {

  versions[kIKMkAddressFC - 1] = nil;
  versions[kIKMkAddressNC - 1] = nil;
  versions[kIKMkAddressMK3MAg - 1] = nil;
}

- (void)setVersion:(IKDeviceVersion *)v {

  if (v.address > kIKMkAddressAll || v.address <= kIKMkAddressMK3MAg) {
    versions[v.address - 1] = v;
  }
}

- (void)requestDeviceVersion {
  NSData *data = [NSData dataWithCommand:MKCommandVersionRequest
                              forAddress:kIKMkAddressAll
                        payloadWithBytes:NULL length:0];

  [self sendRequest:data];
}


- (void)checkForDeviceChange:(IKMkAddress)address {

  if (address != currentDevice) {
    currentDevice = address;
    DDLogVerbose(@"Device changed to %d, send notification", currentDevice);
    [[NSNotificationCenter defaultCenter] postNotificationName:MKDeviceChangedNotification
                                                        object:self
                                                      userInfo:nil];
  }
}


- (void)nextConnectAction {
  DDLogVerbose(@"Next connection action, current state is %ld", connectionState);
  switch (connectionState) {
    case kConnectionStateIdle:
      retryCount = 0;
      connectionState = kConnectionStateWaitNC;
      [self activateNaviCtrl];
      [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:6.0];
      break;
    case kConnectionStateWaitNC:
      if (self.currentDevice == kIKMkAddressFC) {
        connectionState = kConnectionDeviceChecked;
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc postNotificationName:MKConnectedNotification object:self userInfo:nil];
      }
      else {
        connectionState = kConnectionStateWaitFC;
        [self activateFlightCtrl];
        [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:2.0];
      }
      break;
    case kConnectionStateWaitFC:
      connectionState = kConnectionStateWaitNC_2;
      [self activateNaviCtrl];
      [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:2.0];
      break;
    case kConnectionStateWaitNC_2:
      connectionState = kConnectionStateWaitMK3MAG;
      [self activateMK3MAG];
      [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:2.0];
      break;
    case kConnectionStateWaitMK3MAG:
      connectionState = kConnectionDeviceChecked;
      [[NSNotificationCenter defaultCenter] postNotificationName:MKConnectedNotification object:self userInfo:nil];
      break;
    default:
      break;
  }
  DDLogVerbose(@"Next connection action done, current state is %ld", connectionState);
}

- (void)connectionTimeout {
  DDLogVerbose(@"connection timeout, retry count %ld", retryCount);
  if (++retryCount > 3) {

    if (connectionState == kConnectionStateWaitNC) {
      [self stop];
    }
    else {
      connectionState = kConnectionDeviceChecked;
      NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
      [nc postNotificationName:MKConnectedNotification object:self userInfo:nil];
    }
  }
  else {
    switch (connectionState) {
      case kConnectionStateWaitNC:
        connectionState = kConnectionStateWaitNC;
        [self activateNaviCtrl];
        [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:6.0];
        break;
      case kConnectionStateWaitFC:
        connectionState = kConnectionStateWaitFC;
        [self activateFlightCtrl];
        [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:2.0];
        break;
      case kConnectionStateWaitNC_2:
        connectionState = kConnectionStateWaitNC_2;
        [self activateNaviCtrl];
        [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:2.0];
        break;
      case kConnectionStateWaitMK3MAG:
        connectionState = kConnectionStateWaitMK3MAG;
        [self activateMK3MAG];
        [self performSelector:@selector(connectionTimeout) withObject:self afterDelay:2.0];
        break;
    }
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)handleMkResponse:(MKCommandId)command withPayload:(NSData *)payload forAddress:(IKMkAddress)address {
  NSDictionary *d = nil;
  NSString *n = nil;

  switch (command) {
//    case MKCommandLcdMenuResponse:
//      n = MKLcdMenuNotification;
//      d = [payload decodeLcdMenuResponseForAddress:address];
//      break;
    case MKCommandLcdResponse:
      n = MKLcdNotification;
      d = [payload decodeLcdResponseForAddress:address];
      break;
    case MKCommandDebugLabelResponse:
      n = MKDebugLabelNotification;
      d = [payload decodeAnalogLabelResponseForAddress:address];
      break;
    case MKCommandDebugValueResponse:
      n = MKDebugDataNotification;
      d = [payload decodeDebugDataResponseForAddress:address];
      break;
    case MKCommandChannelsValueResponse:
      n = MKChannelValuesNotification;
      d = [payload decodeChannelsDataResponse];
      break;
    case MKCommandReadSettingsResponse:
      n = MKReadSettingNotification;
      d = [payload decodeReadSettingResponse];
      break;
    case MKCommandWriteSettingsResponse:
      n = MKWriteSettingNotification;
      d = [payload decodeWriteSettingResponse];
      break;
    case MKCommandMixerReadResponse:
      n = MKReadMixerNotification;
      d = [payload decodeMixerReadResponse];
      break;
    case MKCommandMixerWriteResponse:
      n = MKWriteMixerNotification;
      d = [payload decodeMixerWriteResponse];
      break;
    case MKCommandChangeSettingsResponse:
      n = MKChangeSettingNotification;
      d = [payload decodeChangeSettingResponse];
      break;
    case MKCommandOsdResponse:
      n = MKOsdNotification;
      d = [payload decodeOsdResponse];
      break;
    case MKCommandData3DResponse:
      n = MKData3DNotification;
      d = [payload decodeData3DResponse];
      break;
    case MKCommandReadPointResponse:
      n = MKReadPointNotification;
      d = [payload decodePointReadResponse];
      break;
    case MKCommandWritePointResponse:
      n = MKWritePointNotification;
      d = [payload decodePointWriteResponse];
      break;
    case MKCommandMotorDataResponse:
      n = MKMotorDataNotification;
      d = [payload decodeMotorDataResponse];
      break;
    case MKCommandVersionResponse:
      n = MKVersionNotification;
      d = [payload decodeVersionResponseForAddress:address];
      [self setVersion:[IKDeviceVersion versionWithData:payload forAddress:(IKMkAddress) address]];
      [self checkForDeviceChange:address];
      break;
    default:
      break;
  }

  [[NSNotificationCenter defaultCenter] postNotificationName:n object:self userInfo:d];
}

- (void)handleMkResponseForDeviceCheck:(MKCommandId)command
                           withPayload:(NSData *)payload
                            forAddress:(IKMkAddress)address {

  switch (command) {

    case MKCommandVersionResponse: {
      [NSObject cancelPreviousPerformRequestsWithTarget:self];
      [self setVersion:[IKDeviceVersion versionWithData:payload forAddress:(IKMkAddress) address]];
      DDLogVerbose(@"Got a device %d version %@", address, [self versionForAddress:address]);

      NSDictionary *d = [NSDictionary dictionaryWithObject:[self versionForAddress:address] forKey:kIKDataKeyVersion];
      [[NSNotificationCenter defaultCenter] postNotificationName:MKFoundDeviceNotification
                                                          object:self
                                                        userInfo:d];

      [self checkForDeviceChange:address];
      [self nextConnectAction];
      break;
    }
    default:
      DDLogVerbose(@"Ignore the command '%c' from address %d", command, address);
      break;
  }
}

@end

