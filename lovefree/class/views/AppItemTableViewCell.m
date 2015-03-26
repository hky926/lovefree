//
//  AppItemTableViewCell.m
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "AppItemTableViewCell.h"

@implementation AppItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) reflsh:(AppItem *)appItem
{
    self.titleLabel.text         = appItem.name;
    self.expirDatatimeLabel.text = appItem.expireDatetime;
    self.shareLabel.text         = appItem.shares;
    self.favoritesLabel.text     = appItem.favorites;
    self.downLabel.text          = appItem.downloads;
    self.currentPriceLabel.text  = appItem.currentPrice;
    self.categoryNameLabel.text  = appItem.categoryName;
}
@end
