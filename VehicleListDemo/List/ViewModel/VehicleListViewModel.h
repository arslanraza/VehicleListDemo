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

@property (nonatomic, readonly) NSArray<Vehicle *> *vehicles;
@property (nonatomic, copy) CompletionBlock completion;
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
