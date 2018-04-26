//
//  VehicleListViewController.m
//  VehicleListDemo
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

#import "VehicleListViewController.h"
#import "VehicleListViewModel.h"
#import "VehicleTableViewCell.h"

#import <VehicleDemoCore/VehicleDemoCore.h>

#import "VehicleListDemo-Swift.h"

@interface VehicleListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet VehicleListViewModel *viewModel;

@end

@implementation VehicleListViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.viewModel = [VehicleListViewModel new];
  
  [self setupObservers];
  [self.viewModel refresh];
}

#pragma mark - Private Methods

- (void)setupObservers {
  __weak typeof(self) weakSelf = self;
  self.viewModel.completion = ^(BOOL success, NSError *error) {
    if (success) {
      [weakSelf.tableView reloadData];
    } else {
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                     message:error.localizedDescription
                                                              preferredStyle:UIAlertControllerStyleAlert];
      [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
      [weakSelf presentViewController:alert animated:YES completion:nil];
    }
  };
}

#pragma mark - UITableViewDataSource & Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.viewModel.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  VehicleTableViewCell *cell = (VehicleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"VehicleTableViewCell"];
  Vehicle *vehicle = self.viewModel.vehicles[indexPath.row];
  [cell configureWith:vehicle];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 140.0;
}

#pragma mark - Public Methods

@end
