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
#import "IKParamSet.h"

@interface ParamSetTest97 : SenTestCase


@end

@implementation ParamSetTest97 {
  NSArray *fields;
}

- (void)setUp {
  fields = @[
      @"Index",
      @"Revision",
      @"Kanalbelegung_00",
      @"Kanalbelegung_01",
      @"Kanalbelegung_02",
      @"Kanalbelegung_03",
      @"Kanalbelegung_04",
      @"Kanalbelegung_05",
      @"Kanalbelegung_06",
      @"Kanalbelegung_07",
      @"Kanalbelegung_08",
      @"Kanalbelegung_09",
      @"Kanalbelegung_10",
      @"Kanalbelegung_11",
      @"GlobalConfig",
      @"Hoehe_MinGas",
      @"Luftdruck_D",
      @"HoeheChannel",
      @"Hoehe_P",
      @"Hoehe_Verstaerkung",
      @"Hoehe_ACC_Wirkung",
      @"Hoehe_HoverBand",
      @"Hoehe_GPS_Z",
      @"Hoehe_StickNeutralPoint",
      @"Stick_P",
      @"Stick_D",
      @"StickGier_P",
      @"Gas_Min",
      @"Gas_Max",
      @"GyroAccFaktor",
      @"KompassWirkung",
      @"Gyro_P",
      @"Gyro_I",
      @"Gyro_D",
      @"Gyro_Gier_P",
      @"Gyro_Gier_I",
      @"Gyro_Stability",
      @"UnterspannungsWarnung",
      @"NotGas",
      @"NotGasZeit",
      @"Receiver",
      @"I_Faktor",
      @"UserParam1",
      @"UserParam2",
      @"UserParam3",
      @"UserParam4",
      @"ServoNickControl",
      @"ServoNickComp",
      @"ServoNickMin",
      @"ServoNickMax",
      @"ServoRollControl",
      @"ServoRollComp",
      @"ServoRollMin",
      @"ServoRollMax",
      @"ServoNickRefresh",
      @"ServoManualControlSpeed",
      @"CamOrientation",
      @"Servo3",
      @"Servo4",
      @"Servo5",
      @"LoopGasLimit",
      @"LoopThreshold",
      @"LoopHysterese",
      @"AchsKopplung1",
      @"AchsKopplung2",
      @"CouplingYawCorrection",
      @"WinkelUmschlagNick",
      @"WinkelUmschlagRoll",
      @"GyroAccAbgleich",
      @"Driftkomp",
      @"DynamicStability",
      @"UserParam5",
      @"UserParam6",
      @"UserParam7",
      @"UserParam8",
      @"J16Bitmask",
      @"J16Timing",
      @"J17Bitmask",
      @"J17Timing",
      @"WARN_J16_Bitmask",
      @"WARN_J17_Bitmask",
      @"AutoPhotoDistance",
      @"NaviGpsModeChannel",
      @"NaviGpsGain",
      @"NaviGpsP",
      @"NaviGpsI",
      @"NaviGpsD",
      @"NaviGpsPLimit",
      @"NaviGpsILimit",
      @"NaviGpsDLimit",
      @"NaviGpsA",
      @"NaviGpsMinSat",
      @"NaviStickThreshold",
      @"NaviWindCorrection",
      @"NaviAccCompensation",
      @"NaviMaxFlyingRange",
      @"NaviAngleLimitation",
      @"NaviPH_LoginTime",
      @"ExternalControl",
      @"OrientationAngle",
      @"CareFreeChannel",
      @"MotorSafetySwitch",
      @"MotorSmooth",
      @"ComingHomeAltitude",
      @"FailSafeTime",
      @"MaxAltitude",
      @"FailsafeChannel",
      @"ServoFilterNick",
      @"ServoFilterRoll",
      @"StartLandChannel",
      @"LandingSpeed",
      @"CompassOffset",
      @"AutoLandingVoltage",
      @"BitConfig",
      @"ServoCompInvert",
      @"ExtraConfig",
      @"GlobalConfig3",
  ];

}

- (void)testParamset97FromFields {

  IKMkParamset97 pMk;

  unsigned char *data = (unsigned char *) &pMk;

  STAssertTrue(sizeof(pMk) >= [fields count], nil);


  for (int i = 0; i < [fields count]; i++) {
    *data = (unsigned char) i;
    data++;
  }

  pMk.Index = 1;
  pMk.Revision = 97;
  strcpy(pMk.Name, "Paramsert97");

  STAssertEquals((int) pMk.GlobalConfig3, (int) ([fields count] - 1), nil);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  [fields enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {

    switch (idx) {
      case 0:
        STAssertEqualObjects(@(1), [p valueForKeyPath:obj], @"The values are not equal for %@", obj);
        break;
      case 1:
        STAssertEqualObjects(@(97), [p valueForKeyPath:obj], @"The values are not equal %@", obj);
        break;
      default:
        STAssertEqualObjects(@(idx), [p valueForKeyPath:obj], @"The values are not equal %@", obj);
        break;
    }
  }];

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}


@end
