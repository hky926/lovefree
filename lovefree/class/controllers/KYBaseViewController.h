//
//  KYBaseViewController.h
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "common.h"

@interface KYBaseViewController : UIViewController
{
    NSDictionary *dataDic;
}
-(id) initWithDic:(NSDictionary *)dic;
-(void) addItem:(NSString *)title position:(NSInteger)pos method:(SEL)method imageName:(NSString *)name;
@end
