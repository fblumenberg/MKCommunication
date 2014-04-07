// ///////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2010-2011, Frank Blumenberg
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


#import "IKDeviceVersion.h"

static NSString *HardwareType[] = {@"Default", @"FlightCtrl", @"NaviCtrl", @"MK3Mag"};


@implementation IKDeviceVersion

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@synthesize address;
@synthesize versionString;
@synthesize versionStringShort;
@synthesize versionMainStringShort;

- (BOOL)hasError {
  return (_version.HardwareError[0] > 0 || _version.HardwareError[1] > 0);
}

- (NSString *)deviceName {
  return HardwareType[address];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

+ (id)versionWithData:(NSData *)data forAddress:(IKMkAddress)theAddress {
  return [[IKDeviceVersion alloc] initWithData:data forAddress:theAddress];
}

- (id)initWithData:(NSData *)data forAddress:(IKMkAddress)theAddress {
  self = [super init];
  if (self != nil) {

    address = theAddress;

    memcpy(&_version, [data bytes], sizeof(_version));

    versionString = [NSString stringWithFormat:@"%@ %d.%02d %c",
                                               HardwareType[address],
                                               _version.SWMajor,
                                               _version.SWMinor,
                                               (_version.SWPatch + 'a')];


    versionStringShort = [NSString stringWithFormat:@"%d.%02d%c",
                                                    _version.SWMajor,
                                                    _version.SWMinor,
                                                    (_version.SWPatch + 'a')];

    versionMainStringShort = [NSString stringWithFormat:@"%d.%02d",
                                                        _version.SWMajor,
                                                        _version.SWMinor];
  }
  return self;
}


- (NSString *)description {
  return versionString;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)errorDescriptions {
  NSMutableArray *a = [NSMutableArray arrayWithCapacity:0];

  if ([self hasError]) {

    [a addObject:[NSString stringWithFormat:@"%02x %02x %02x %02x %02x",
                                            _version.HardwareError[0],
                                            _version.HardwareError[1],
                                            _version.HardwareError[2],
                                            _version.HardwareError[3],
                                            _version.HardwareError[4]]];
  }

  if (address == kIKMkAddressFC) {
    if ((_version.HardwareError[0] & FC_ERROR0_GYRO_NICK) == FC_ERROR0_GYRO_NICK) {
      [a addObject:NSLocalizedStringFromTable(@"Hardware: Gyro NICK error",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & FC_ERROR0_GYRO_ROLL) == FC_ERROR0_GYRO_ROLL) {
      [a addObject:NSLocalizedStringFromTable(@"Hardware: Gyro ROLL error",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & FC_ERROR0_GYRO_YAW) == FC_ERROR0_GYRO_YAW) {
      [a addObject:NSLocalizedStringFromTable(@"Hardware: Gyro YAW error",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & FC_ERROR0_ACC_NICK) == FC_ERROR0_ACC_NICK) {
      [a addObject:NSLocalizedStringFromTable(@"Hardware: Acc NICK error",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & FC_ERROR0_ACC_ROLL) == FC_ERROR0_ACC_ROLL) {
      [a addObject:NSLocalizedStringFromTable(@"Hardware: Acc ROLL error",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & FC_ERROR0_ACC_TOP) == FC_ERROR0_ACC_TOP) {
      [a addObject:NSLocalizedStringFromTable(@"Hardware: Acc Z error (FlightCtrl installed upside down ?)",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & FC_ERROR0_PRESSURE) == FC_ERROR0_PRESSURE) {
      [a addObject:NSLocalizedStringFromTable(@"Hardware: Pressure sensor error",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & FC_ERROR0_CAREFREE) == FC_ERROR0_CAREFREE) {
      [a addObject:NSLocalizedStringFromTable(@"Carefree control error/not possible (compass okay?, Orientation = 0 ?)",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[1] & FC_ERROR1_I2C) == FC_ERROR1_I2C) {
      [a addObject:NSLocalizedStringFromTable(@"I2C bus error (check I2C connections)",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[1] & FC_ERROR1_BL_MISSING) == FC_ERROR1_BL_MISSING) {
      [a addObject:NSLocalizedStringFromTable(@"BL-Ctrl missing (check connections & mixer setup)",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[1] & FC_ERROR1_SPI_RX) == FC_ERROR1_SPI_RX) {
      [a addObject:NSLocalizedStringFromTable(@"SPI communication error. No data from Navi-Ctrl",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[1] & FC_ERROR1_PPM) == FC_ERROR1_PPM) {
      [a addObject:NSLocalizedStringFromTable(@"No receiver signal",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[1] & FC_ERROR1_MIXER) == FC_ERROR1_MIXER) {
      [a addObject:NSLocalizedStringFromTable(@"Mixer setup error (check mixervalues)",@"MKTCommunication", @"")];
    }
  }
  if (address == kIKMkAddressNC) {
    if ((_version.HardwareError[0] & NC_ERROR0_SPI_RX) == NC_ERROR0_SPI_RX) {
      [a addObject:NSLocalizedStringFromTable(@"SPI: no data from Flight-Ctrl",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & NC_ERROR0_COMPASS_RX) == NC_ERROR0_COMPASS_RX) {
      [a addObject:NSLocalizedStringFromTable(@"no data from MK3Mag",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & NC_ERROR0_FC_INCOMPATIBLE) == NC_ERROR0_FC_INCOMPATIBLE) {
      [a addObject:NSLocalizedStringFromTable(@"Flight-Ctrl software incompatible",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & NC_ERROR0_COMPASS_INCOMPATIBLE) == NC_ERROR0_COMPASS_INCOMPATIBLE) {
      [a addObject:NSLocalizedStringFromTable(@"MK3Mag software incompatible",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & NC_ERROR0_GPS_RX) == NC_ERROR0_GPS_RX) {
      [a addObject:NSLocalizedStringFromTable(@"no data from MKGPS",@"MKTCommunication", @"")];
    }
    if ((_version.HardwareError[0] & NC_ERROR0_COMPASS_VALUE) == NC_ERROR0_COMPASS_VALUE) {
      [a addObject:NSLocalizedStringFromTable(@"invalid compass value (MK3Mag not calibrated ?)",@"MKTCommunication", @"")];
    }
  }

  return a;
}

@end
