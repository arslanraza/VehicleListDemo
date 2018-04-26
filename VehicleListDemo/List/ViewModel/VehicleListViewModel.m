//
//  VehicleListViewModel.m
//  VehicleListDemo
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

#import "VehicleListViewModel.h"

#import "VehicleListDemo-Swift.h"
#import <VehicleDemoNetwork/VehicleDemoNetwork.h>

@interface VehicleListViewModel ()

@property (nonatomic, strong) NSArray<Vehicle *> *vehicles;
@property (nonatomic, strong) VehicleApiClient *apiClient;

@end

@implementation VehicleListViewModel

#pragma mark - Life Cycle Methods

- (instancetype)init {
  self = [super init];
  if (self) {
    self.apiClient = [VehicleApiClient new];
  }
  return self;
}

#pragma mark - Private Methods

#pragma mark - Public Methods

- (NSUInteger)numberOfRows {
  return self.vehicles.count;
}

- (void)refresh {
  __weak typeof(self) weakSelf = self;
  self.isLoading = YES;
  [self.apiClient fetchVehiclesWithCompletion:^(NSArray<Vehicle *> *vehicles, NSError *error) {
    weakSelf.isLoading = NO;
    if (!error) {
      weakSelf.vehicles = vehicles;
      dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.completion(YES, nil);
      });
    } else {
      dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.completion(NO, nil);
      });
    }
  }];
}

@end
