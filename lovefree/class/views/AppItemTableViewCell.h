//
//  AppItemTableViewCell.h
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppItem.h"
@interface AppItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *expirDatatimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritesLabel;
@property (weak, nonatomic) IBOutlet UILabel *downLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;

-(void) reflsh:(AppItem *)appItem;
@end
