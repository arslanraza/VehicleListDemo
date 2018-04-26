//
//  VehicleTableViewCell.m
//  VehicleListDemo
//
//  Created by Arslan Raza on 27/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

#import "VehicleTableViewCell.h"

@implementation VehicleTableViewCell

- (void)awakeFromNib {
  [super awakeFromNib];
  
  self.mapVIew.layer.cornerRadius = 4;
  self.containerView.layer.cornerRadius = 8;
  self.containerView.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.4] CGColor];
  self.containerView.layer.borderWidth = 1.0;
  self.containerView.layer.shadowOffset = CGSizeMake(0.2, 1.2);
  self.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
  
}

@end
