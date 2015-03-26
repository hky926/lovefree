//
//  HttpManager.m
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HttpManager.h"
#import "AppItem.h"
#import "LimetTime.h"

@implementation HttpManager

+(HttpManager *)shardManger
{
    static HttpManager *httpManager = nil;
    if (!httpManager) {
        httpManager = [[HttpManager alloc] init];
    }
    return httpManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taskDict    = [[NSMutableDictionary alloc] init];
        _restultDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)addDownload:(NSString *)url type:(NSInteger) type
{
    HttpDownload *hd = [_taskDict objectForKey:url];
    if (!hd) {
        HttpDownload *hd = [[HttpDownload alloc] init];
        hd.httpUrl = url;
        hd.type = type;
        hd.deleage = self;
        hd.method = @selector(downloadComple:);
        [hd downLoadFromUrl:url];
        
        [_taskDict setObject:hd forKey:url];

    }else{
        NSLog(@"not down");
    }
}
-(id)objectForKey:(NSString *)key
{
    return [_restultDict objectForKey:key];
}
-(void)downloadComple:(HttpDownload *)hd
{
    switch (hd.type) {
        case LIMIT_TYPE:
            [self pariseList:hd];
            break;
        case REDUCE_TYPE:
            [self pariseList:hd];
            break;
        case FREE_TYPE:
            [self pariseList:hd];
            break;
        case RANK_TYPE:
            [self pariseList:hd];
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:hd.httpUrl object:nil];
}

-(void) pariseList:(HttpDownload *)hd
{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:hd.downloadData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *appItemArray = [[NSMutableArray alloc] init];
    if (dic) {
        NSArray *array  = [dic objectForKey:@"applications"];
        for (NSDictionary *appDic in array) {
            AppItem *appItem = [[AppItem alloc] init];
            
            /*@property(nonatomic,copy) NSString *applicationId;
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
            @property(nonatomic,copy) NSString *currentPrice;*/

            appItem.applicationId  = appDic[@"applicationId"];
            appItem.categoryName   = appDic[@"categoryName"];
            appItem.info           = appDic[@"description"];
            appItem.downloads      = appDic[@"downloads"];
            appItem.favorites      = appDic[@"favorites"];
            appItem.shares         = appDic[@"shares"];
            appItem.iconUrl        = appDic[@"iconUrl"];
            appItem.name           = appDic[@"name"];
            appItem.lastPrice      = appDic[@"lastPrice"];
            appItem.starOverall    = appDic[@"starOverall"];
            appItem.currentPrice   = appDic[@"currentPrice"];
            appItem.expireDatetime = [LimetTime culLimetTime:appDic[@"expireDatetime"]];
            [appItemArray addObject:appItem];
        }
        [_restultDict setObject:appItemArray forKey:hd.httpUrl];
    }
}
-(NSDictionary *) jsonObjectFromObject:(HttpDownload *)hd
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:hd.downloadData options:NSJSONReadingMutableContainers error:nil];
    return dic;
}
@end
