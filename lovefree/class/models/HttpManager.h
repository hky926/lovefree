//
//  HttpManager.h
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpDownload.h"
#import "common.h"
@interface HttpManager : NSObject
{
    //保存下载结果
    NSMutableDictionary *_restultDict;
    //保存下载任务
    NSMutableDictionary *_taskDict;
}

+(HttpManager *)shardManger;
-(id)objectForKey:(NSString *)key;
-(void)addDownload:(NSString *)url type:(NSInteger) type;
@end
