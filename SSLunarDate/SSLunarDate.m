//
//  SSLunarDate.m
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-6.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import "SSLunarDate.h"
#import "libLunar.h"

@implementation SSLunarDate


- (id) init
{
    self = [super init];
    if (self) {
        _calendar = [NSCalendar currentCalendar];
    }
    
    return self;
}

-(void) printLunarDay:(NSDate *) solarDate
{
    Date mysolar;
    Date *mylunar;
    [self NSDataToLunarDate:solarDate withDate:&mysolar];
    
    NSLog(@"Solar: year: %d month: %d day: %d", mysolar.year, mysolar.month, mysolar.day);
    LibLunarContext *ctx = createLunarContext();
    NSAssert(ctx != NULL, @"create conctext faield");
    
    Solar2Lunar(ctx, &mysolar);
    
    mylunar = getLunarDate(ctx);
    
    NSLog(@"Lunar: year: %d month: %d day: %d", mylunar->year, mylunar->month,
          mylunar->day);

    freeLunarContext(ctx);
}

- (void) getLunarDateForNSDate:(NSDate *) solarDate forDate:(Date *) lunar
{
    Date mysolar;
    [self NSDataToLunarDate:solarDate withDate:&mysolar];
    
    NSAssert(lunar != NULL, @"pass null to convert lunar");
    
    NSLog(@"Solar: year: %d month: %d day: %d", mysolar.year, mysolar.month, mysolar.day);
    
    LibLunarContext *ctx = createLunarContext();
    NSAssert(ctx != NULL, @"create conctext faield");
    Solar2Lunar(ctx, &mysolar);
    Date *mylunar = getLunarDate(ctx);
    memcpy(lunar, mylunar, sizeof(*mylunar));

    freeLunarContext(ctx);
}


- (void) NSDataToLunarDate:(NSDate *) date withDate:(Date *) lunarDate
{
    unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit;
    NSDateComponents *parts = [_calendar components:flags fromDate:date];
    
    lunarDate->year = parts.year;
    lunarDate->month = parts.month;
    lunarDate->day = parts.day;
    lunarDate->hour = parts.hour;
}



@end
