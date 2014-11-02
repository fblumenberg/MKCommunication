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

@interface ParamSetTest : SenTestCase

@end

@implementation ParamSetTest

static void fillIKMkParamset85(IKMkParamset85 *p) {

  p->Index = 1;
  p->Revision = 85;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->MaxHoehe = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->Gier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->NaviGpsModeControl = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsACC = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviSpeedCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->OrientationModeControl = 121;
  p->MotorSafetySwitch = 122;
//  p->MotorSmooth                    =123;
//  p->ComingHomeAltitude             =124;
//  p->FailSafeTime                   =125;
//  p->MaxAltitude                    =126;
  //	p->FailsafeChannel                =127;
  //	p->ServoFilterNick                =128;
  //	p->ServoFilterRoll                =129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->ExtraConfig = 132;
  //	p->GlobalConfig3                  =133;
//	p->crc                            =134;
  strcpy(p->Name, "Paramsert80");
}

static void fillIKMkParamset88(IKMkParamset88 *p) {

  p->Index = 1;
  p->Revision = 88;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->MaxHoehe = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->NaviGpsModeControl = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsACC = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeModeControl = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
//	p->FailsafeChannel                =127;
//	p->ServoFilterNick                =128;
//	p->ServoFilterRoll                =129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->ExtraConfig = 132;
//	p->GlobalConfig3                  =133;
//	p->crc                            =134;
  strcpy(p->Name, "Paramsert88");
}

static void fillIKMkParamset90(IKMkParamset90 *p) {

  p->Index = 1;
  p->Revision = 90;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->MaxHoehe = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->NaviGpsModeControl = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsACC = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeModeControl = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
//	p->crc                            =134;
  strcpy(p->Name, "Paramsert90");
}

static void fillIKMkParamset91(IKMkParamset90 *p) {

  p->Index = 1;
  p->Revision = 91;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->MaxHoehe = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->NaviGpsModeControl = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsACC = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeModeControl = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramsert90");
}

static void fillIKMkParamset92(IKMkParamset92 *p) {

  p->Index = 1;
  p->Revision = 92;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->MaxHoehe = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->AutoPhotoDistance = 192;
  p->NaviGpsModeControl = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsACC = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeModeControl = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramsert92");
}

static void fillIKMkParamset95(IKMkParamset95 *p) {

  memset(p, 0, sizeof(IKMkParamset95));
  p->Index = 1;
  p->Revision = 95;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->HoeheChannel = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->AutoPhotoDistance = 192;
  p->NaviGpsModeChannel = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsA = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeChannel = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->StartLandChannel = 134;
  p->LandingSpeed = 135;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramsert95");
}

static void fillIKMkParamset97(IKMkParamset97 *p) {

  memset(p, 0, sizeof(IKMkParamset97));
  p->Index = 1;
  p->Revision = 97;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->HoeheChannel = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->AutoPhotoDistance = 192;
  p->NaviGpsModeChannel = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsA = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeChannel = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->StartLandChannel = 134;
  p->LandingSpeed = 135;
  p->CompassOffset = 136;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  p->AutoLandingVoltage = 137;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramsert97");
}


static void fillIKMkParamset98(IKMkParamset98 *p) {

  memset(p, 0, sizeof(IKMkParamset98));
  p->Index = 1;
  p->Revision = 98;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->HoeheChannel = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->AutoPhotoDistance = 192;
  p->NaviGpsModeChannel = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsA = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeChannel = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->StartLandChannel = 134;
  p->LandingSpeed = 135;
  p->CompassOffset = 136;
  p->AutoLandingVoltage = 137;
  p->ComingHomeVoltage = 138;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramsert98");
}

static void fillIKMkParamset100(IKMkParamset100 *p) {

  memset(p, 0, sizeof(IKMkParamset100));
  p->Index = 1;
  p->Revision = 100;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->HoeheChannel = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->AutoPhotoDistance = 192;
  p->NaviGpsModeChannel = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsA = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeChannel = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->StartLandChannel = 134;
  p->LandingSpeed = 135;
  p->CompassOffset = 136;
  p->AutoLandingVoltage = 137;
  p->ComingHomeVoltage = 138;

  p->AutoPhotoAtitudes = 139;
  p->SingleWpSpeed = 140;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramset100");
}

static void fillIKMkParamset102(IKMkParamset102 *p) {

  memset(p, 0, sizeof(IKMkParamset102));
  p->Index = 1;
  p->Revision = 102;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->HoeheChannel = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_GPS_Z = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->AutoPhotoDistance = 192;
  p->NaviGpsModeChannel = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsA = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeChannel = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->Servo3OffValue = 141;
  p->Servo3OnValue = 142;
  p->Servo4OffValue = 143;
  p->Servo4OnValue = 144;

  p->StartLandChannel = 134;
  p->LandingSpeed = 135;
  p->CompassOffset = 136;
  p->AutoLandingVoltage = 137;
  p->ComingHomeVoltage = 138;

  p->AutoPhotoAtitudes = 139;
  p->SingleWpSpeed = 140;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramset102");
}


static void fillIKMkParamset103(IKMkParamset103 *p) {
  
  memset(p, 0, sizeof(IKMkParamset103));
  p->Index = 1;
  p->Revision = 103;
  p->Kanalbelegung[0] = 13;
  p->Kanalbelegung[1] = 14;
  p->Kanalbelegung[2] = 15;
  p->Kanalbelegung[3] = 16;
  p->Kanalbelegung[4] = 17;
  p->Kanalbelegung[5] = 18;
  p->Kanalbelegung[6] = 19;
  p->Kanalbelegung[7] = 20;
  p->Kanalbelegung[8] = 21;
  p->Kanalbelegung[9] = 22;
  p->Kanalbelegung[10] = 23;
  p->Kanalbelegung[11] = 24;
  p->GlobalConfig = 26;
  p->Hoehe_MinGas = 27;
  p->Luftdruck_D = 28;
  p->HoeheChannel = 29;
  p->Hoehe_P = 30;
  p->Hoehe_Verstaerkung = 31;
  p->Hoehe_ACC_Wirkung = 32;
  p->Hoehe_HoverBand = 33;
  p->Hoehe_TiltCompensation = 34;
  p->Hoehe_StickNeutralPoint = 35;
  p->Stick_P = 36;
  p->Stick_D = 37;
  p->StickGier_P = 38;
  p->Gas_Min = 39;
  p->Gas_Max = 40;
  p->GyroAccFaktor = 41;
  p->KompassWirkung = 42;
  p->Gyro_P = 43;
  p->Gyro_I = 44;
  p->Gyro_D = 45;
  p->Gyro_Gier_P = 46;
  p->Gyro_Gier_I = 47;
  p->Gyro_Stability = 48;
  p->UnterspannungsWarnung = 49;
  p->NotGas = 50;
  p->NotGasZeit = 51;
  p->Receiver = 52;
  p->I_Faktor = 53;
  p->UserParam1 = 54;
  p->UserParam2 = 55;
  p->UserParam3 = 56;
  p->UserParam4 = 57;
  p->ServoNickControl = 58;
  p->ServoNickComp = 59;
  p->ServoNickMin = 60;
  p->ServoNickMax = 61;
  p->ServoRollControl = 62;
  p->ServoRollComp = 63;
  p->ServoRollMin = 64;
  p->ServoRollMax = 65;
  p->ServoNickRefresh = 66;
  p->ServoManualControlSpeed = 67;
  p->CamOrientation = 68;
  p->Servo3 = 69;
  p->Servo4 = 70;
  p->Servo5 = 71;
  p->LoopGasLimit = 72;
  p->LoopThreshold = 73;
  p->LoopHysterese = 74;
  p->AchsKopplung1 = 75;
  p->AchsKopplung2 = 76;
  p->CouplingYawCorrection = 77;
  p->WinkelUmschlagNick = 78;
  p->WinkelUmschlagRoll = 79;
  p->GyroAccAbgleich = 80;
  p->Driftkomp = 81;
  p->DynamicStability = 82;
  p->UserParam5 = 83;
  p->UserParam6 = 84;
  p->UserParam7 = 85;
  p->UserParam8 = 86;
  p->J16Bitmask = 87;
  p->J16Timing = 88;
  p->J17Bitmask = 89;
  p->J17Timing = 90;
  p->WARN_J16_Bitmask = 91;
  p->WARN_J17_Bitmask = 92;
  p->AutoPhotoDistance = 192;
  p->NaviGpsModeChannel = 93;
  p->NaviGpsGain = 94;
  p->NaviGpsP = 95;
  p->NaviGpsI = 96;
  p->NaviGpsD = 97;
  p->NaviGpsPLimit = 98;
  p->NaviGpsILimit = 99;
  p->NaviGpsDLimit = 110;
  p->NaviGpsA = 111;
  p->NaviGpsMinSat = 112;
  p->NaviStickThreshold = 113;
  p->NaviWindCorrection = 114;
  p->NaviAccCompensation = 115;
  p->NaviMaxFlyingRange = 116;
  p->NaviAngleLimitation = 117;
  p->NaviPH_LoginTime = 118;
  p->ExternalControl = 119;
  p->OrientationAngle = 120;
  p->CareFreeChannel = 121;
  p->MotorSafetySwitch = 122;
  p->MotorSmooth = 123;
  p->ComingHomeAltitude = 124;
  p->FailSafeTime = 125;
  p->MaxAltitude = 126;
  p->FailsafeChannel = 127;
  p->ServoFilterNick = 128;
  p->ServoFilterRoll = 129;
  p->BitConfig = 130;
  p->ServoCompInvert = 131;
  p->Servo3OffValue = 141;
  p->Servo3OnValue = 142;
  p->Servo4OffValue = 143;
  p->Servo4OnValue = 144;
  
  p->StartLandChannel = 134;
  p->LandingSpeed = 135;
  p->CompassOffset = 136;
  p->AutoLandingVoltage = 137;
  p->ComingHomeVoltage = 138;
  
  p->AutoPhotoAtitudes = 139;
  p->SingleWpSpeed = 140;
  p->ExtraConfig = 132;
  p->GlobalConfig3 = 133;
  //	p->crc                            =134;
  strcpy(p->Name, "Paramset103");
}


- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  // Tear-down code here.

  [super tearDown];
}

- (void)testInvalidRevision {
  IKMkParamset103 pMk;
  fillIKMkParamset103(&pMk);

  pMk.Revision = 0;
  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  STAssertThrows([IKParamSet settingWithData:origPayload], @"");
}

- (void)testParamset103 {
  IKMkParamset103 pMk;
  fillIKMkParamset103(&pMk);
  
  STAssertEquals((int) pMk.Revision, (int) 103, nil);
  
  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");
  
  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");
  
  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");
  
  STAssertEqualObjects(name, p.Name, @"The names are not equal");
  
  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset103Random {
  IKMkParamset103 pMk;
  
  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 103;
  
  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");
  
  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  
  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset102 {
  IKMkParamset102 pMk;
  fillIKMkParamset102(&pMk);

  STAssertEquals((int) pMk.Revision, (int) 102, nil);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset102Random {
  IKMkParamset102 pMk;

  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 102;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}


- (void)testParamset100 {
  IKMkParamset100 pMk;
  fillIKMkParamset100(&pMk);

  STAssertEquals((int) pMk.Revision, (int) 100, nil);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset100Random {
  IKMkParamset100 pMk;

  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 100;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}


- (void)testParamset98 {
  IKMkParamset98 pMk;
  fillIKMkParamset98(&pMk);

  STAssertEquals((int) pMk.Revision, (int) 98, nil);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

// Not efficent
- (id)dataWithHexString:(NSString *)command {
  command = [command stringByReplacingOccurrencesOfString:@" " withString:@""];
  NSMutableData *commandToSend = [[NSMutableData alloc] init];
  unsigned char whole_byte;
  char byte_chars[3] = {'\0', '\0', '\0'};
  int i;
  for (i = 0; i < [command length] / 2; i++) {
    byte_chars[0] = [command characterAtIndex:i * 2];
    byte_chars[1] = [command characterAtIndex:i * 2 + 1];
    whole_byte = strtol(byte_chars, NULL, 16);
    [commandToSend appendBytes:&whole_byte length:1];
  }

  return [commandToSend copy];
}

- (void)testParamset98FromString {

  NSString *mkData = @"02610304 01020705 0608090a 0b0c6b1e 2807140f 1e01007f 08100608 e61b4064 780a6478 0621415a 01100000 00008032 18e68055 46dc033c 007d7d7d 325a327d 34464e4e 20004600 000000aa 28cc2800 aa000564 645a784b 554b2806 08322af5 8c020015 06000000 1e960000 00000c00 1f000272 40416769 6c650000 00000000 0054f4c3 0c30c30c 30c30f72 409fbdc3 6c30d00d 30d3f437 c411b5d8 4c30c30e 38c30c30 c30c3bc3 0c3bc30c";

  IKMkParamset98 pMk;
  fillIKMkParamset98(&pMk);

  STAssertEquals((int) pMk.Revision, (int) 98, nil);

  NSData *origPayload = [self dataWithHexString:mkData];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");

  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(p.Name, @"Agile", @"The names are not equal");
}


- (void)testParamset98Random {
  IKMkParamset98 pMk;

  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 98;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}


- (void)testParamset97 {
  IKMkParamset97 pMk;
  fillIKMkParamset97(&pMk);

  STAssertEquals((int) pMk.Revision, (int) 97, nil);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");
  STAssertEqualObjects(p.Name, @"Paramsert97", @"Check if name is correct");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset97Random {
  IKMkParamset97 pMk;

  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 97;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}


- (void)testParamset95 {
  IKMkParamset95 pMk;
  fillIKMkParamset95(&pMk);

  STAssertEquals((int) pMk.Revision, (int) 95, nil);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset95Random {
  IKMkParamset95 pMk;

  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 95;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset92 {
  IKMkParamset92 pMk;
  fillIKMkParamset92(&pMk);
  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset92Random {
  IKMkParamset92 pMk;

  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 92;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}


- (void)testParamset90 {
  IKMkParamset90 pMk;
  fillIKMkParamset90(&pMk);
  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset90Random {
  IKMkParamset90 pMk;

  arc4random_buf(&pMk, sizeof(pMk));
  pMk.Revision = 90;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset88 {
  IKMkParamset88 pMk;
  fillIKMkParamset88(&pMk);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset85 {
  IKMkParamset85 pMk;
  fillIKMkParamset85(&pMk);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}

- (void)testParamset91 {
  IKMkParamset90 pMk;
  fillIKMkParamset91(&pMk);

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");

  STAssertTrue(p.isValid, nil);

  NSString *name = [NSString stringWithCString:pMk.Name encoding:NSASCIIStringEncoding];
  STAssertNotNil(p.Name, @"IKParamSet name");

  STAssertEqualObjects(name, p.Name, @"The names are not equal");

  STAssertEqualObjects(origPayload, [p data], @"The encoded data is not equal");
}


- (void)testCompassOffset {

  IKMkParamset102 pMk;
  fillIKMkParamset102(&pMk);

  STAssertEquals((int) pMk.Revision, (int) 102, nil);

  pMk.CompassOffset = 0;

  NSData *origPayload = [NSData dataWithBytes:(void *) &pMk length:sizeof(pMk)];
  STAssertNotNil(origPayload, @"Payload creating failed");

  IKParamSet *p = [IKParamSet settingWithData:origPayload];
  STAssertNotNil(p, @"IKParamSet creating failed");
  STAssertEquals([p isValid], YES, @"Data should be valid");

  STAssertEqualObjects(p.CompassOffset, @(0), nil);

  NSArray* testData =@[
                     @[@(60),@(NO),@(60)],
                     @[@(60),@(YES),@(188)],
                     @[@(-60),@(NO),@(196)],
                     @[@(-60),@(YES),@(68)],
                     @[@(4),@(NO),@(4)],
                     @[@(4),@(YES),@(132)],
                     ];

  
  for (NSArray* d in testData) {
    p.CompassOffset = d[0];
    p.CompassOffset_DisableDeclCalc=d[1];
    NSData *data = [p data];
    IKMkParamset102 *pMk2 = (IKMkParamset102 *) [data bytes];

    STAssertEquals((unsigned int)pMk2->CompassOffset, [d[2] unsignedIntValue], nil);
  }

}

@end
