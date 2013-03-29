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

@interface MKCommandChannelsTest : SenTestCase
@end

@implementation MKCommandChannelsTest

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

- (void)testDecodingChannels {

  int16_t channelValues[26];

  for (int i = 0; i < 26; i++)
    channelValues[i] = i;

  NSData *data = [NSData dataWithCommand:MKCommandChannelsValueResponse
                              forAddress:kIKMkAddressFC
                        payloadWithBytes:channelValues
                                  length:sizeof(channelValues)];


  STAssertNotNil(data, nil);
  STAssertTrue([data length] > 0U, nil);

  NSData *payload = [data payload];

  int16_t channelValues2[26];

  STAssertTrue([payload length] >= (NSUInteger) sizeof(channelValues2), nil);
  memcpy(channelValues2, [payload bytes], sizeof(channelValues2));

  for (int i = 0; i < 26; i++)
          STAssertEquals(channelValues[i], channelValues2[i], nil);
}

- (void)testDecodingChannelsDictionary {

  int16_t channelValues[26];

  for (int i = 0; i < 26; i++)
    channelValues[i] = i;

  NSData *data = [NSData dataWithCommand:MKCommandChannelsValueResponse
                              forAddress:kIKMkAddressFC
                        payloadWithBytes:channelValues
                                  length:sizeof(channelValues)];

  STAssertNotNil(data, nil);
  STAssertTrue([data length] > 0U, nil);

  NSData *payload = [data payload];

  NSDictionary *d = [payload decodeChannelsDataResponse];

  STAssertTrue([d count] > 0U, nil);

  NSData *payload2 = [d objectForKey:kMKDataKeyChannels];

  STAssertNotNil(payload2, nil);
  int16_t channelValues2[26];

  STAssertTrue([payload2 length] >= (NSUInteger) sizeof(channelValues2), nil);
  memcpy(channelValues2, [payload2 bytes], sizeof(channelValues2));

  for (int i = 0; i < 26; i++)
          STAssertEquals(channelValues[i], channelValues2[i], nil);
}


@end
