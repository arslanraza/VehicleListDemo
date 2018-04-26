//
//  VehicleListViewController.m
//  VehicleListDemo
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

#import "VehicleListViewController.h"
#import "VehicleListViewModel.h"

@interface VehicleListViewController () <UITableViewDataSource>

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
      [weakSelf presentViewController:alert animated:YES completion:nil];
    }
  };
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.viewModel.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [UITableViewCell new];
}

#pragma mark - Public Methods

@end
