//
//  HttpDownload.h
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpDownload : NSObject<NSURLConnectionDataDelegate>
{
    NSURLConnection *_httpConnection;
}
@property(nonatomic,copy) id deleage;
@property(nonatomic,assign) SEL method;
@property(nonatomic,copy) NSMutableData *downloadData;
@property(nonatomic,assign) NSInteger type;
@property(nonatomic,copy) NSString *httpUrl;
-(void) downLoadFromUrl:(NSString *)url;
@end
