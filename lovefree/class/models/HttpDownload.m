//
//  HttpDownload.m
//  lovefree
//
//  Created by huai on 15/3/25.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "HttpDownload.h"

@implementation HttpDownload

-(void) downLoadFromUrl:(NSString *)url
{
    _httpConnection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
    _downloadData = [[NSMutableData alloc] init];
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.downloadData setLength:0];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.downloadData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"downlog error");
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    if ([self.deleage respondsToSelector:self.method]) {
        [self.deleage performSelector:self.method withObject:self afterDelay:0];
    }else{
        NSStringFromSelector(self.method);
        NSLog(@"%@",NSStringFromSelector(self.method));
    }
}
@end
