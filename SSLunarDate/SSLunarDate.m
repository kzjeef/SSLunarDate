//
//  SSLunarDate.m
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-6.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import "SSLunarDate.h"
#import "libLunar.h"

@interface SSLunarDate()
{
    NSCalendar *_calendar;
    SSLunarDateFormatter *_formater;
    LibLunarContext *_ctx;
    NSDate *_solarDate;
    SSLunarSimpleDate   _simpleSolarDate;
}
@end

@implementation SSLunarDate


- (id) init
{
    self = [super init];
    if (self) {
        [self setupAndDoConvert:[NSDate date]];
    }
    
    return self;
}

- (void) dealloc
{
    // not call [supoer dealloc] since ARC already provide this.
    freeLunarContext(_ctx);
    _ctx = NULL;
}

- (id) initWithDate:(NSDate *) solarDate
{
    self = [super init];
    if (self) {
        [self setupAndDoConvert:solarDate];
    }
    return self;
}

- (void) setupAndDoConvert:(NSDate *) solarDate
{
    _calendar = [NSCalendar currentCalendar];
    _formater = [SSLunarDateFormatter sharedLunarDateFormatter];
    [self NSDataToLunarDate:solarDate withDate:&_simpleSolarDate];
    
    NSLog(@"solarDate:%d %d", _simpleSolarDate.month, _simpleSolarDate.day);
    _calendar = [NSCalendar currentCalendar];
    _formater = [SSLunarDateFormatter sharedLunarDateFormatter];
    NSAssert(_ctx == NULL,
             @"libLunar Context was not null when setup, leak...");
    _ctx = createLunarContext();
    NSAssert(_ctx != NULL, @"create context failed");
    Solar2Lunar(_ctx, &_simpleSolarDate);
}

- (NSString *) monthString
{
    NSAssert(_formater, @"formatter is null!");
    
    return [_formater getLunarMonthForDate:_ctx];
}

- (NSString *) dayString
{
    NSAssert(_formater, @"formatter is null");
    return [_formater getDayNameForDate:_ctx];
}

- (NSString *) sehgnxiaoString
{
    NSAssert(_formater, @"formatter is null");
    return [_formater getShengXiaoNameForDate:_ctx];
}

- (BOOL) isLeapMonth
{
    NSAssert(_formater, @"formatter is null");
    return [_formater isLeapMonthForDate:_ctx];
}

- (void) NSDataToLunarDate:(NSDate *) date withDate:(SSLunarSimpleDate *) lunarDate
{
    unsigned int flags = NSYearCalendarUnit             \
        | NSMonthCalendarUnit | NSDayCalendarUnit       \
        | NSHourCalendarUnit;
    NSDateComponents *parts = [_calendar components:flags fromDate:date];
    
    lunarDate->year = parts.year;
    lunarDate->month = parts.month;
    lunarDate->day = parts.day;
    lunarDate->hour = parts.hour;
}



@end
