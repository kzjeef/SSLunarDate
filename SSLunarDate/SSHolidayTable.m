//
//  SSHolidayTable.m
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-21.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import "SSHolidayTable.h"
#import "SSLunarDateHoliday.h"

@interface SSHolidayTable()
{
    SSHolidayRegion _region;

    NSCalendar      *_calendar;
    NSDictionary    *_solarHolidayCN;
}

@property (readonly) NSDictionary *solarHolidayCN;
@property (readonly) SSHolidayRegion region;
@property (readonly) NSCalendar      *calendar;

@end

@implementation SSHolidayTable

- (NSDictionary *) solarHolidayCN
{
    if (!_solarHolidayCN)
        _solarHolidayCN = @{
                          @"0101":NSLocalizedString(@"元旦",""),
                          @"0214":NSLocalizedString(@"情人节",""),
                          @"0308":NSLocalizedString(@"妇女节",""),
                          @"0312":NSLocalizedString(@"植树节",""),
                          @"0401":NSLocalizedString(@"愚人节",""),
                          @"0501":NSLocalizedString(@"劳动节",""),
                          @"0504":NSLocalizedString(@"青年节",""),
                          @"0601":NSLocalizedString(@"儿童节",""),
                          @"0701":NSLocalizedString(@"建党节",""),
                          @"0801":NSLocalizedString(@"建军节",""),
                          @"0910":NSLocalizedString(@"教师节",""),
                          @"1001":NSLocalizedString(@"国庆节",""),
                          @"1225":NSLocalizedString(@"圣诞节","")
                          };
    
    return _solarHolidayCN;
}

- (id) initWithRegion:(SSHolidayRegion) region calendar:(NSCalendar *)calendar
{
    self = [self init];
    if (self) {
        _region = region;
        _calendar = calendar;
    }
    return self;
}

- (NSArray *) getHolidayListWithDate:(NSDate *)date
{
    NSString *index;
    NSMutableArray *result = [[NSMutableArray alloc] init];

    unsigned int flags = NSYearCalendarUnit             \
        | NSMonthCalendarUnit | NSDayCalendarUnit;

    NSDateComponents *parts = [self.calendar components:flags fromDate:date];
    
    if (self.region == SSHolidayRegionChina) {

        index = [SSLunarDateHoliday convertIndexFrom:parts.month day:parts.day];
        NSString *holiday  = [self.solarHolidayCN objectForKey:index];
        if (holiday)
            [result addObject:holiday];
    }
    
    return result;
}

@end
