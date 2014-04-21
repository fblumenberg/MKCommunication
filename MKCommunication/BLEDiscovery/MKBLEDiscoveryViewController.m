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


#import "MKBLEDiscoveryViewController.h"

#import "BLE.h"


@interface MKBLEDiscoveryViewController ()

@property(strong) BLE *ble;
@property(assign) BOOL isSearching;

@property(strong) UIActivityIndicatorView *bluetoothActivity;

@end

@implementation MKBLEDiscoveryViewController

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:UITableViewStyleGrouped];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.ble = [[BLE alloc] init];
  [self.ble controlSetup];

  self.bluetoothActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (void)cancel {
  [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  self.title = NSLocalizedStringFromTable(@"Bluetooth 4.0 LE", @"MKTCommunication", @"BLE discovery title");
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedStringFromTable(@"Cancel", @"MKTCommunication", @"BT descovery cancel")
                                                                           style:UIBarButtonItemStyleDone
                                                                          target:self
                                                                          action:@selector(cancel)];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  [self startScanning];
}


#pragma mark - Scann methods

- (void)startScanning {
  [self.ble findBLEPeripherals:3];
  [NSTimer scheduledTimerWithTimeInterval:(float) 3.0 target:self selector:@selector(scanTimer:) userInfo:nil repeats:NO];
  self.isSearching = YES;

  [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
                        withRowAnimation:UITableViewRowAnimationAutomatic];

}


// Called when scan period is over
- (void)scanTimer:(NSTimer *)timer {
  if (self.ble.peripherals.count > 0) {
    self.devices = [self.ble.peripherals copy];
  }
  self.isSearching = NO;

  [self.tableView reloadData];
}

+ (NSString *)getUUIDString:(CFUUIDRef)ref {
  NSString *str = [NSString stringWithFormat:@"%@", ref];
  return [[NSString stringWithFormat:@"%@", str] substringWithRange:NSMakeRange(str.length - 36, 36)];
}


#pragma mark - Table view delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  if (indexPath.section == 0 && self.isSearching) {
    return nil;
  }

  return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  if (indexPath.section == 0 && !self.isSearching) {
    [self startScanning];
  }
  else {

    if ([self.delegate respondsToSelector:@selector(discoveryView:didSelectDeviceWithIdentifier:name:)]) {
      CBPeripheral *peripheral = self.devices[indexPath.row];
      [self.delegate discoveryView:self didSelectDeviceWithIdentifier:[peripheral.identifier UUIDString] name:peripheral.name];
    }
    [self cancel];
  }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return section == 0 ? 1 : [self.devices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  UITableViewCell *cell = nil;

  if (indexPath.section == 0) {
    static NSString *ScannCellIdentifier = @"ScannCell";

    cell = [tableView dequeueReusableCellWithIdentifier:ScannCellIdentifier];
    if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ScannCellIdentifier];
    }

    cell.userInteractionEnabled=NO;
    
    if (self.isSearching) {
      cell.textLabel.text = NSLocalizedStringFromTable(@"Scanning…", @"MKTCommunication", @"BLE discovery");
      cell.accessoryView = self.bluetoothActivity;
      self.bluetoothActivity.frame = CGRectMake(0, 0, 40, 40);
      [self.bluetoothActivity startAnimating];

    }
    else {
      if( self.ble.CM.state==CBCentralManagerStateUnsupported ){
        cell.textLabel.text = NSLocalizedStringFromTable(@"The platform does not support Bluetooth low energy", @"MKTCommunication", @"BLE discovery");
      }
      else{
        cell.textLabel.text = NSLocalizedStringFromTable(@"Rescann", @"MKTCommunication", @"BLE discovery");
        cell.userInteractionEnabled=YES;
      }
        
      cell.accessoryView = nil;
    }
  }
  else {

    static NSString *CellIdentifier = @"Cell";

    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }


    CBPeripheral *peripheral = self.devices[indexPath.row];

    cell.textLabel.text = peripheral.name;
    cell.detailTextLabel.text = [peripheral.identifier UUIDString];
  }

  return cell;
}


@end
