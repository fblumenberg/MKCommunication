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
#import "NSData+MKCommandDecode.h"
#import "NSData+MKCommandEncode.h"

@interface MKCommandTest : SenTestCase
@end

@implementation MKCommandTest

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

- (void)testDecodingAndEncoding {
  
  NSData *payload = [@"TEST" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertNotNil(payload,nil);

  NSData *data = [payload dataWithCommand:MKCommandLcdResponse forAddress:kIKMkAddressFC];
  STAssertNotNil(data,nil);
  STAssertTrue([data length]> 0U,nil);
  
  NSData* data2 = [data copy];
  STAssertEqualObjects(data, data2, nil);

  STAssertEquals([data2 command], MKCommandLcdResponse, nil);
  STAssertEquals([data2 address], kIKMkAddressFC, nil);
  
  NSData* payload2 = [data2 payload] ;
  
  NSRange r = [payload2 rangeOfData:payload options:0 range:NSMakeRange(0, [payload2 length])];
  STAssertTrue(NSEqualRanges(r,NSMakeRange(0, [payload length])),nil);
}

- (void)testDecodingAndEncodingPointer {
  
  NSData *payload = [@"TEST" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertNotNil(payload,nil);
  
  NSData *data = [NSData dataWithCommand:MKCommandLcdResponse 
                              forAddress:kIKMkAddressFC 
                        payloadWithBytes:[payload bytes] 
                                  length:[payload length]];
  STAssertNotNil(data,nil);
  STAssertTrue([data length]> 0U,nil);
  
  NSData* data2 = [data copy];
  STAssertEqualObjects(data, data2, nil);
  
  STAssertEquals([data2 command], MKCommandLcdResponse, nil);
  STAssertEquals([data2 address], kIKMkAddressFC, nil);
  
  NSData* payload2 = [data2 payload] ;
  
  NSRange r = [payload2 rangeOfData:payload options:0 range:NSMakeRange(0, [payload2 length])];
  STAssertTrue(NSEqualRanges(r,NSMakeRange(0, [payload length])),nil);
}


- (void)testDecodingAndEncodingOneByte {
  
  NSData *payload = [@"TEST" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertNotNil(payload,nil);
  
  NSData *data = [NSData dataWithCommand:MKCommandLcdResponse forAddress:kIKMkAddressFC payloadForByte:0xAF];
  STAssertNotNil(data,nil);
  STAssertTrue([data length]> 0U,nil);
  
  NSData* data2 = [data copy];
  STAssertEqualObjects(data, data2, nil);
  
  STAssertEquals([data2 command], MKCommandLcdResponse, nil);
  STAssertEquals([data2 address], kIKMkAddressFC, nil);
  
  NSData* payload2 = [data2 payload];
  const char * payloadBytes = [payload2 bytes];
  
  STAssertEquals((char)0xAF, payloadBytes[0], nil);
}

- (void)testDecodingVersionRequest{
  NSData* data=[@"#av@w" dataUsingEncoding:NSASCIIStringEncoding];

  STAssertEquals([data command], MKCommandVersionRequest, nil);
  STAssertEquals([data address], kIKMkAddressAll, nil);
}

- (void)testDecodingVersionResponse{
  NSData* data=[@"#cV=>]H==A=========PY" dataUsingEncoding:NSASCIIStringEncoding];
  
  STAssertEquals([data command], MKCommandVersionResponse, nil);
  STAssertEquals([data address], kIKMkAddressNC, nil);
}

- (void)testDecodingVersionResponseInvCrc{
  NSData* data=[@"#cV=>]H==Ac========PY" dataUsingEncoding:NSASCIIStringEncoding];
  
  STAssertFalse([data isCrcOk],nil);

  STAssertThrows([data command], nil);
  STAssertThrows([data address], nil);
}

- (void)testDecodingVersionResponseInvData{
  NSData* data=[@"cV=>]H==Ac========PY" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertFalse([data isMkData],nil);
}


@end
