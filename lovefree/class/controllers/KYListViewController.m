//
//  KYListViewController.m
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "KYListViewController.h"
#import "HttpManager.h"
#import "AppItemTableViewCell.h"
@interface KYListViewController ()

@end

@implementation KYListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addItem:@"分类" position:LEFT_BAR_BUTTON method:@selector(leftClick:) imageName:@"buttonbar_action"];
    [self addItem:@"设置" position:RIGHT_BAR_BUTTON method:@selector(rightClick:) imageName:@"buttonbar_action"];
    
    _tableView            = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-44) style:UITableViewStylePlain];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _searchBar                 = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    _tableView.tableHeaderView = _searchBar;
    _searchController          = [[UISearchController alloc] initWithSearchResultsController:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [self.view addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(tap)];
    
    NSString *url = [dataDic objectForKey:@"URL"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updataData:) name:url object:nil];
    
//    [[HttpManager shardManger] addDownload:url type:LIMIT_TYPE];
}
-(void) tap
{
    [_searchBar resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) leftClick:(id)sender
{
    
}
-(void) rightClick:(id)sender
{
    
}
-(void) updataData:(NSNotification *)notification
{
    NSLog(@"data updat:%@",notification.name);
    _dataArray = [[HttpManager shardManger] objectForKey:notification.name];
    [_tableView reloadData];
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cell";
    AppItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"AppItemTableViewCell" owner:self options:nil][0];
    }
    [cell reflsh:_dataArray[indexPath.row]];
    return cell;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
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
