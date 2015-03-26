//
//  KYListViewController.h
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "KYBaseViewController.h"

@interface KYListViewController : KYBaseViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    UISearchBar *_searchBar;
    UISearchController *_searchController;
}
@end
