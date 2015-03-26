//
//  StartView.m
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "StartView.h"

@implementation StartView

-(void) createImage
{
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsBackground"]];
    _forengroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsForeground"]];
    
    _backgroundImageView.frame = CGRectMake(0, 0, 65, 23);
    _backgroundImageView.contentMode= UIViewContentModeLeft;
    _backgroundImageView.clipsToBounds = YES;
    _forengroundImageView.frame = CGRectMake(0, 0, 65, 23);
}
-(void) setStart:(CGFloat) start
{
    CGRect f = _backgroundImageView.frame;
    f.size.width = f.size.width*(start/5);
    _forengroundImageView.frame = f;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createImage];
    }
    return self;
}
-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImage];
    }
    return self;
}
@end
