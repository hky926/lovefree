//
//  KYBaseViewController.m
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "KYBaseViewController.h"

@interface KYBaseViewController ()

@end

@implementation KYBaseViewController

-(id) initWithDic:(NSDictionary *)dic;
{
    self = [super init];
    if (self) {
        [self createTitleView:[dic objectForKey:@"TITLE"]];
        self.tabBarItem.image = [UIImage imageNamed:[dic objectForKey:@"IMAGE"]];
        self.tabBarItem.title = [dic objectForKey:@"TITLE"];
        dataDic = dic;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) addItem:(NSString *)title position:(NSInteger)pos method:(SEL)method imageName:(NSString *)name;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 30);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button addTarget:self action:method forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (pos == LEFT_BAR_BUTTON) {
        self.navigationItem.leftBarButtonItem = item;
    }else{
        self.navigationItem.rightBarButtonItem = item;
    }
}
-(void) createTitleView:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font =  [UIFont systemFontOfSize:14];
    label.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = label;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
