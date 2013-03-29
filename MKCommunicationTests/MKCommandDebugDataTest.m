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

#import "IKMkDataTypes.h"
#import "IKDebugData.h"

#import "MKDataConstants.h"
#import "NSData+MKCommandDecode.h"
#import "NSData+MKCommandEncode.h"
#import "NSData+MKPayloadDecode.h"
#import "NSData+MKPayloadEncode.h"

@interface MKCommandDebugDataTest : SenTestCase
@end

@implementation MKCommandDebugDataTest

- (void)setUpClass {
  // Run at start of all tests in the class
}

- (void)tearDownClass {
  // Run at end of all tests in the class
}

- (void)setUp {
  // Run before each test method
}

- (void)tearDown {
  // Run after each test method
}   

- (void)testDecodingDebugData {
  
  IKMkDebugOut mkData;
  
  mkData.Digital[0]=YES;
  mkData.Digital[1]=YES;
  
  for(int i=0;i<32;i++)
    mkData.Analog[i] = i;

  NSData *data = [NSData dataWithCommand:MKCommandDebugValueResponse 
                              forAddress:kIKMkAddressFC 
                        payloadWithBytes:&mkData 
                                  length:sizeof(mkData)];

  STAssertNotNil(data,nil);
  STAssertTrue([data length]>0U,nil);
  
  NSData* payload = [data payload];

  IKDebugData* d= [IKDebugData dataWithData:payload forAddress:[data address]];
  STAssertNotNil(d,nil);

  STAssertEquals((BOOL)mkData.Digital[0], [d digitalValueAtIndex:0],nil);
  STAssertEquals((BOOL)mkData.Digital[1], [d digitalValueAtIndex:1],nil);
  
  mkData.Digital[0]=YES;
  mkData.Digital[1]=YES;
  
  for(int i=0;i<32;i++)
    STAssertEquals((NSInteger)mkData.Analog[i], [d analogValueAtIndex:i].integerValue,nil);
}

- (void)testDecodingDebugDataDictionary {
  
  IKMkDebugOut mkData;
  
  mkData.Digital[0]=YES;
  mkData.Digital[1]=YES;
  
  for(int i=0;i<32;i++)
    mkData.Analog[i] = i;
  
  NSData *data = [NSData dataWithCommand:MKCommandDebugValueResponse 
                              forAddress:kIKMkAddressFC 
                        payloadWithBytes:&mkData 
                                  length:sizeof(mkData)];
  
  STAssertNotNil(data,nil);
  STAssertTrue([data length]>0U,nil);
  
  NSData* payload = [data payload];
  
  NSDictionary* di = [payload decodeDebugDataResponseForAddress:[data address]];
  STAssertTrue([di count]>0U,nil);
  
  IKDebugData* d=[di objectForKey:kIKDataKeyDebugData];
  STAssertNotNil(d,nil);
  
  STAssertEquals((BOOL)mkData.Digital[0], [d digitalValueAtIndex:0],nil);
  STAssertEquals((BOOL)mkData.Digital[1], [d digitalValueAtIndex:1],nil);
  
  mkData.Digital[0]=YES;
  mkData.Digital[1]=YES;
  
  for(int i=0;i<32;i++)
    STAssertEquals((NSInteger)mkData.Analog[i], [d analogValueAtIndex:i].integerValue,nil);

}


@end
