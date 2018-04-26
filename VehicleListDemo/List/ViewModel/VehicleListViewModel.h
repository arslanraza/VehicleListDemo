//
//  VehicleListViewModel.h
//  VehicleListDemo
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vehicle;

typedef void(^CompletionBlock)(BOOL success, NSError *error);


@interface VehicleListViewModel : NSObject

/**
 A readonly array which contains the list of vehicles returned from the server
 */
@property (nonatomic, readonly) NSArray<Vehicle *> *vehicles;

/**
 The completion block will be invoked on main thread in case of failure and success
 */
@property (nonatomic, copy) CompletionBlock completion;

/**
 A boolean that indicates wether a reuqest is in progress or not
 */
@property (readwrite, assign) BOOL isLoading;


/**
 Returns number of rows

 @return Returns 0 if no vehicle is loaded from server
 */
- (NSUInteger)numberOfRows;


/**
 Refreshes the list of vehicles by trying to invoke a network request
 */
- (void)refresh;

@end
