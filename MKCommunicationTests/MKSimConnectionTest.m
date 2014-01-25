// ///////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013, Frank Blumenberg
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

#import <UIKit/UIKit.h>

#import <SenTestingKit/SenTestingKit.h>
#import <SenTestingKitAsync/SenTestingKitAsync.h>

#import "MKSimConnection.h"
#import "NSData+MKCommandEncode.h"
#import "NSData+MKCommandDecode.h"
#import "NSData+MKPayloadDecode.h"

#import "IKParamSet.h"

@interface MKSimConnectionTest : SenTestCase<MKConnectionDelegate>

@end

@implementation MKSimConnectionTest

MKSimConnection* connection;

- (void)setUp {
  connection = [[MKSimConnection alloc] initWithDelegate:self];
}

- (void)testConnectAsync
{
  STFailAfter(2.0, @"Timeout");
  
  STAssertFalse(connection.isConnected, nil);
  [connection connectTo:nil];
}

- (void)didConnectTo:(NSString *)hostOrDevice{
  [self requestSettingForIndex:3];
}

- (void)requestSettingForIndex:(NSInteger)theIndex {
  uint8_t index = (uint8_t)theIndex;
  
  NSData *data = [NSData dataWithCommand:MKCommandReadSettingsRequest
                              forAddress:kIKMkAddressFC
                        payloadWithBytes:&index
                                  length:1];
  
  [connection writeMkData:data];
}

- (void)didReadMkData:(NSData *)data{
  NSData *strData = [data subdataWithRange:NSMakeRange(0, [data length] - 1)];

  STAssertTrue([strData isCrcOk], nil);
  
  NSData *payload = [strData payload];
  IKMkAddress address = [strData address];

  STAssertEquals(address, kIKMkAddressFC, nil);

  IKParamSet *p = [IKParamSet settingWithData:payload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(p.Revision, @(98), nil);
  STAssertEqualObjects(p.Name, @"Easy", nil);
  
  STSuccess();
}

@end
