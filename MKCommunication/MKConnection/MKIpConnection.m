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


#import "MKIpConnection.h"
#import "AsyncSocket.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

#define CONNECT_TIMEOUT 2
#define CONNECT_MAX_COUNT 15



static NSString *const MKIpConnectionException = @"MKIpConnectionException";

///////////////////////////////////////////////////////////////////////////////
#pragma mark - DDRegisteredDynamicLogging
static int ddLogLevel = LOG_LEVEL_WARN;

@interface MKIpConnection (DDRegisteredDynamicLogging) <DDRegisteredDynamicLogging>
@end

@implementation MKIpConnection (DDRegisteredDynamicLogging)
+ (int)ddLogLevel {
  return ddLogLevel;
}

+ (void)ddSetLogLevel:(int)logLevel {
  ddLogLevel = logLevel;
}
@end
///////////////////////////////////////////////////////////////////////////////


@implementation MKIpConnection {
  AsyncSocket *asyncSocket;
  NSUInteger _connectCounter;
  BOOL _reconnect;
  
  NSString* _host;
  int _port;
}

#pragma mark Properties

@synthesize delegate;

#pragma mark Initialization

- (id)init {
  return [self initWithDelegate:nil];
}

- (id)initWithDelegate:(id <MKConnectionDelegate>)theDelegate; {
  self = [super init];
  if (self) {
    
    asyncSocket = [[AsyncSocket alloc] init];
    [asyncSocket setDelegate:self];
    
    self.delegate = theDelegate;
  }
  return self;
}

#pragma mark - mark MKInput

- (BOOL)connectTo:(NSDictionary *)connectionInfo {
  
  NSAssert(delegate != nil, @"Attempting to connect without a delegate. Set a delegate first.");
  
  NSArray *hostItems = [[connectionInfo objectForKey:kKConnectionInfoAddress] componentsSeparatedByString:@":"];
  if ([hostItems count] != 2) {
    DDLogError(@"Attempting to connect without a port. Set a port first.");
    return NO;
  }
  
  _port = [[hostItems objectAtIndex:1] intValue];
  _host = [hostItems objectAtIndex:0];
  
  _connectCounter=0;
  _reconnect=NO;
  DDLogVerbose(@"Try to connect to %@ on port %d", _host, _port);
  return [asyncSocket connectToHost:_host onPort:_port withTimeout:CONNECT_TIMEOUT error:nil];
}

- (BOOL)isConnected; {
  return [asyncSocket isConnected];
}

- (void)disconnect; {
  DDLogVerbose(@"Try to disconnect from %@ on port %d", [asyncSocket connectedHost], [asyncSocket connectedPort]);
  [asyncSocket disconnect];
}

- (void)writeMkData:(NSData *)data; {
  [asyncSocket writeData:data withTimeout:-1 tag:0];
}

#pragma mark -
#pragma mark AsyncSocketDelegate

- (BOOL)onSocketWillConnect:(AsyncSocket *)sock {
  DDLogVerbose(@"About to connect to %@", [sock connectedHost]);
  return TRUE;
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port; {
  DDLogVerbose(@"Did connect to %@ on port %d", host, port);
  _reconnect=NO;
  _connectCounter=0;
  
  if ([delegate respondsToSelector:@selector(didConnectTo:)]) {
    [delegate didConnectTo:host];
  }
  
  
  DDLogVerbose(@"Start reading the first data frame");
  [sock readDataToData:[AsyncSocket CRData] withTimeout:-1 tag:0];
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag; {
  if ([delegate respondsToSelector:@selector(didReadMkData:)]) {
    [delegate didReadMkData:data];
  }
  DDLogVerbose(@"Did read data %@",data);
  
  DDLogVerbose(@"Start reading the next data frame");
  [sock readDataToData:[AsyncSocket CRData] withTimeout:-1 tag:0];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag; {
  DDLogVerbose(@"Finished writing the next data frame");
}

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err; {
  DDLogInfo(@"Will disconnect with an error %@", err);
  _connectCounter+=1;
  
  if(err.code == AsyncSocketConnectTimeoutError && _connectCounter < CONNECT_MAX_COUNT){
    _reconnect=YES;
  }
  else{
    _reconnect=NO;
    if ([delegate respondsToSelector:@selector(willDisconnectWithError:)]) {
      [delegate willDisconnectWithError:err];
    }
  }
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock; {
  DDLogVerbose(@"Disconnected from %@ on port %d", [asyncSocket connectedHost], [asyncSocket connectedPort]);
  
  if(!_reconnect){
    if ([delegate respondsToSelector:@selector(didDisconnect)]) {
      [delegate didDisconnect];
    }
  }
  else{
    DDLogVerbose(@"Retry to connect to %@ on port %d connect count %lu", _host, _port,(unsigned long)_connectCounter);
    [asyncSocket connectToHost:_host onPort:_port withTimeout:CONNECT_TIMEOUT error:nil];
  }
  
}

@end
