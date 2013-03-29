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
#import "IKDeviceVersion.h"

#import "MKDataConstants.h"
#import "NSData+MKCommandDecode.h"
#import "NSData+MKPayloadDecode.h"

@interface MKCommandVersionTest : SenTestCase
@end

@implementation MKCommandVersionTest

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

- (void)testDecodingFCVersion {
  
  NSData *data = [@"#bV=BMH============PH" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertNotNil(data,nil);

  STAssertEquals([data command], MKCommandVersionResponse, nil);
  STAssertEquals([data address], kIKMkAddressFC, nil);

  NSData* payload2 = [data payload] ;

  IKDeviceVersion* v = [IKDeviceVersion versionWithData:payload2 forAddress:[data address]];
  
  STAssertEquals(v.address, [data address],nil);
  STAssertEqualObjects(v.versionString, @"FlightCtrl 0.84 a",nil);
  STAssertEqualObjects(v.versionStringShort, @"0.84a",nil);
  
  STAssertFalse(v.hasError,nil);
}

- (void)testDecodingFCVersionError {
  
  NSData *data = [@"#bV=B]H==M=?=======Pj" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertNotNil(data,nil);
  
  STAssertEquals([data command], MKCommandVersionResponse, nil);
  STAssertEquals([data address], kIKMkAddressFC, nil);
  
  NSData* payload2 = [data payload] ;
  
  IKDeviceVersion* v = [IKDeviceVersion versionWithData:payload2 forAddress:[data address]];
  
  STAssertEquals(v.address, [data address],nil);
  STAssertEqualObjects(v.versionString, @"FlightCtrl 0.88 e",nil);
  STAssertEqualObjects(v.versionStringShort, @"0.88e",nil);
  
  STAssertTrue(v.hasError,nil);
  STAssertTrue([[v errorDescriptions] count]>0U,nil);
}

- (void)testDecodingNCVersion {
  
  NSData *data = [@"#cV=>]H==A=========PY" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertNotNil(data,nil);
  
  STAssertEquals([data command], MKCommandVersionResponse, nil);
  STAssertEquals([data address], kIKMkAddressNC, nil);
  
  NSData* payload2 = [data payload] ;
  
  IKDeviceVersion* v = [IKDeviceVersion versionWithData:payload2 forAddress:[data address]];
  
  STAssertEquals(v.address, [data address],nil);
  STAssertEqualObjects(v.versionString, @"NaviCtrl 0.24 b",nil);
  STAssertEqualObjects(v.versionStringShort, @"0.24b",nil);
  
  STAssertFalse(v.hasError,nil);
}

- (void)testDecodingNCVersionDictionary {
  
  NSData *data = [@"#cV=>]H==A=========PY" dataUsingEncoding:NSASCIIStringEncoding];
  STAssertNotNil(data,nil);
  
  STAssertEquals([data command], MKCommandVersionResponse, nil);
  STAssertEquals([data address], kIKMkAddressNC, nil);
  
  NSData* payload2 = [data payload] ;
  
  IKDeviceVersion* v = [IKDeviceVersion versionWithData:payload2 forAddress:[data address]];
  
  STAssertEquals(v.address, [data address],nil);
  STAssertEqualObjects(v.versionString, @"NaviCtrl 0.24 b",nil);
  STAssertEqualObjects(v.versionStringShort, @"0.24b",nil);
  
  STAssertFalse(v.hasError,nil);
  
  NSDictionary* d = [payload2 decodeVersionResponseForAddress:[data address]];

  STAssertTrue([d count]>0U,nil);
  
  IKDeviceVersion* v2=[d objectForKey:kIKDataKeyVersion];
  
  STAssertNotNil(v2,nil);
  
  STAssertEquals(v.address, v2.address,nil);
  STAssertEqualObjects(v.versionString, v.versionString,nil);
  STAssertEqualObjects(v.versionStringShort, v.versionStringShort,nil);
}



@end
