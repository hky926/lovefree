//
//  AppItem.h
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppItem : NSObject
@property(nonatomic,copy) NSString *applicationId;
@property(nonatomic,copy) NSString *categoryName;
@property(nonatomic,copy) NSString *info;
@property(nonatomic,copy) NSString *downloads;
@property(nonatomic,copy) NSString *favorites;
@property(nonatomic,copy) NSString *shares;
@property(nonatomic,copy) NSString *expireDatetime;
@property(nonatomic,copy) NSString *iconUrl;
@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *lastPrice;
@property(nonatomic,copy) NSString *starOverall;
@property(nonatomic,copy) NSString *currentPrice;
@end
