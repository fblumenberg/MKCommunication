// ///////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2014, Frank Blumenberg
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


#import "MKBleConnection.h"
#import "BLE.h"
#import "DDLog.h"

static NSString *const MKIpConnectionException = @"MKBleConnectionException";

@interface MKBleConnection () <BLEDelegate>

@property(strong) BLE *ble;
@property(strong) NSString *uuid;
@property(strong) NSMutableData *mkData;

@end

///////////////////////////////////////////////////////////////////////////////
#pragma mark - DDRegisteredDynamicLogging
static int ddLogLevel = LOG_LEVEL_WARN;

@interface MKBleConnection (DDRegisteredDynamicLogging) <DDRegisteredDynamicLogging>
@end

@implementation MKBleConnection (DDRegisteredDynamicLogging)
+ (int)ddLogLevel {
    return ddLogLevel;
}

+ (void)ddSetLogLevel:(int)logLevel {
    ddLogLevel = logLevel;
}
@end

///////////////////////////////////////////////////////////////////////////////

@implementation MKBleConnection

@synthesize delegate;


- (id)initWithDelegate:(id <MKConnectionDelegate>)theDelegate; {
    self = [super init];
    if (self) {
        
        self.ble = [[BLE alloc] init];
        [self.ble controlSetup];
        self.ble.delegate = self;
        
        
        self.delegate = theDelegate;
    }
    return self;
}

- (BOOL)connectTo:(NSDictionary *)connectionInfo {
    
    self.uuid = connectionInfo[@"address"];
    
    DDLogVerbose(@"Try to connect to BLE device  with UUID %@", self.uuid);
    
    
    if ([self isConnected]) {
        [[self.ble CM] cancelPeripheralConnection:[self.ble activePeripheral]];
        return NO;
    }
    
    self.mkData = [NSMutableData dataWithCapacity:512];
    
    
    self.ble.peripherals = nil;
    
    [NSTimer scheduledTimerWithTimeInterval:(float) 0.2 target:self selector:@selector(doConnectionTimer:) userInfo:nil repeats:NO];
    
    
    return YES;
}

- (void)doConnectionTimer:(NSTimer *)timer {
    
    if ([self.ble findBLEPeripherals:2] == -1) {
        
        //        return NO;
    }
    
    [NSTimer scheduledTimerWithTimeInterval:(float) 2.0 target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
}


- (void)connectionTimer:(NSTimer *)timer {
    if (self.ble.peripherals.count > 0) {
        [self.ble connectPeripheral:[self.ble.peripherals objectAtIndex:0]];
        
    }
    else {
        
        if ([delegate respondsToSelector:@selector(willDisconnectWithError:)]) {
            NSDictionary *userInfo = @{
                                       NSLocalizedDescriptionKey : NSLocalizedStringFromTable(@"The device is not available", @"MKTCommunication", @"MKBleConnection")
                                       };
            
            [delegate willDisconnectWithError:[NSError errorWithDomain:@"de.frankblumenberg.mktool" code:1 userInfo:userInfo]];
        }
    }
}


- (BOOL)isConnected {
    return self.ble.activePeripheral && self.ble.activePeripheral.state == CBPeripheralStateConnected;
}

- (void)disconnect {
    if (self.ble.activePeripheral) {
        if (self.ble.activePeripheral.state == CBPeripheralStateConnected) {
            [[self.ble CM] cancelPeripheralConnection:[self.ble activePeripheral]];
        }
    }
}

- (void)writeMkData:(NSData *)data {
    NSLog(@"Write Data %@",data);
    [self.ble write:data];
}


- (void)bleDidConnect {
    if ([delegate respondsToSelector:@selector(didConnectTo:)]) {
        [delegate didConnectTo:self.uuid];
    }
}

- (void)bleDidDisconnect {
    if ([delegate respondsToSelector:@selector(didDisconnect)]) {
        [delegate didDisconnect];
    }
}

- (void)bleDidUpdateRSSI:(NSNumber *)rssi {
    
}

- (void)bleDidReceiveData:(unsigned char *)packet length:(int)length {
    
    NSData *data = [NSData dataWithBytes:packet length:length];
    if ([data length] > 0) {
        
        /*
         * The new data, which may only be partial, gets appended to the previously
         * collected buffer in self.mkData.
         * Then a line delimiter is searched, and any complete lines are passed
         * to the delegate, and removed from the local buffer in self.mkData.
         * We repeat this search for lines until no more are found.
         */
        
        [self.mkData appendData:data];
        
        Boolean again;
        do {
            again = false;
            
            const char *haystackBytes = [self.mkData bytes];
            static char needle = '\r';
            
            for (int i = 0; i < [self.mkData length]; i++) {
                if (haystackBytes[i] == needle) { // check for line delimiter
                    
                    // extract the line
                    NSRange r = {0, i + 1};
                    NSData *cmdData = [self.mkData subdataWithRange:r];
                    
                    // remove the line from the receive buffer
                    [self.mkData replaceBytesInRange:r withBytes:NULL length:0];
                    
                    if ([delegate respondsToSelector:@selector(didReadMkData:)]) {
                        [delegate didReadMkData:cmdData];
                    }
                    again = true; // see if there are more lines to process
                    break;
                }
            }
        } while (again);
        
    }
    
}


@end
