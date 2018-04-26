//
//  VehicleTableViewCell.h
//  VehicleListDemo
//
//  Created by Arslan Raza on 27/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface VehicleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet MKMapView *mapVIew;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end
