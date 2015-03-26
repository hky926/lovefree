//
//  LimetTime.m
//  lovefree
//
//  Created by huai on 15/3/26.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "LimetTime.h"

@implementation LimetTime


+ (NSString *)culLimetTime:(NSString *)time
{
    //nsdateFormatter 直接把当前时间转换成了gmt时间...T_T所以不用转成本地时间了
    if (![time isEqual:[NSNull null]]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss.S"];
        NSDate *toDate = [dateFormatter dateFromString:time];
        NSDate *date = [NSDate date];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"INFO:%@ toDate:%@\n",time,toDate);
        
        if (toDate && date) {
            int mask = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond;
            NSDateComponents *commponet = [cal components:mask fromDate:date toDate:toDate options:0];
            NSString *timeStr = [NSString stringWithFormat:@"%02d:%02d:%02d",[commponet hour],[commponet minute],[commponet second]];
            return timeStr;
        }
    }
    return @"";
}
//将GTM时间转换成本地时间
+(NSDate *) currentTime
{
    NSDate *localDate = [NSDate date];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger offtime = [timeZone secondsFromGMTForDate:localDate];
    localDate = [localDate dateByAddingTimeInterval:offtime];
    return localDate;
}
@end
