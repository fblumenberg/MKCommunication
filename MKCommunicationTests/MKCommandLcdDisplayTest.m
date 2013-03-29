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
#import "IKLcdDisplay.h"

#import "MKDataConstants.h"
#import "NSData+MKCommandDecode.h"
#import "NSData+MKCommandEncode.h"
#import "NSData+MKPayloadDecode.h"
#import "NSData+MKPayloadEncode.h"

@interface MKCommandLcdDisplayTest : SenTestCase
@end

@implementation MKCommandLcdDisplayTest

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

- (void)testDecodingLcdDiplay {
  
  NSString *screen = @"A1234567890123456789B1234567890123456789C1234567890123456789D1234567890123456789";
  
  NSData *payload = [screen dataUsingEncoding:NSASCIIStringEncoding];

  NSData *data = [payload dataWithCommand:MKCommandLcdResponse forAddress:kIKMkAddressFC];
  STAssertNotNil(data,nil);
  STAssertTrue([data length]>0U,nil);

  NSData* payload2 = [data payload] ;

  IKLcdDisplay* l= [IKLcdDisplay menuWithData:payload2 forAddress:[data address]];
  
  STAssertEqualObjects([l screenTextJoinedByString:@"|"],@"A1234567890123456789|B1234567890123456789|C1234567890123456789|D1234567890123456789",nil);
}

- (void)testDecodingLcdDiplayDictionary {
  
  NSString *screen = @"A1234567890123456789B1234567890123456789C1234567890123456789D1234567890123456789";
  
  NSData *payload = [screen dataUsingEncoding:NSASCIIStringEncoding];
  
  NSData *data = [payload dataWithCommand:MKCommandLcdResponse forAddress:kIKMkAddressFC];
  STAssertNotNil(data,nil);
  STAssertTrue([data length]> 0U,nil);

  
  NSData* payload2 = [data payload] ;
  
  NSDictionary* d = [payload2 decodeLcdResponseForAddress:[data address]];
  
  STAssertTrue([d count]>0U,nil);
  
  IKLcdDisplay* l=[d objectForKey:kIKDataKeyLcdDisplay];
  
  STAssertNotNil(l,nil);

  STAssertEqualObjects([l screenTextJoinedByString:@"|"],@"A1234567890123456789|B1234567890123456789|C1234567890123456789|D1234567890123456789",nil);
}


@end
