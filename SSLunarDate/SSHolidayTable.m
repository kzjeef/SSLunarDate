//
//  SSHolidayTable.m
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-21.
//  Copyright (c) 2013 Jiejing Zhang. All rights reserved.

//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 2
//  of the License, or any later version.
// 
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
// 
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software Foundation,
//  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
//

#import "SSHolidayTable.h"
#import "SSLunarDateHoliday.h"

@interface SSHolidayTable()
{
    SSHolidayRegion _region;

    NSCalendar      *_calendar;
    NSDictionary    *_solarHolidayCN;
    NSDictionary    *_solarHolidayHK;
    NSDictionary    *_solarHolidayTW;
    NSDictionary    *_solarHolidayUS;
    NSDictionary    *_solarHolidayCA;

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
                          @"0501":NSLocalizedString(@"劳动节",""),
                          @"0601":NSLocalizedString(@"儿童节",""),
                            @"0801":NSLocalizedString(@"建军节", ""),
                          @"0910":NSLocalizedString(@"教师节",""),
                          @"1001":NSLocalizedString(@"国庆节",""),
                          @"1225":NSLocalizedString(@"圣诞节","")
                          };
    
    return _solarHolidayCN;
}

// TODO: 耶稣受难日..
- (NSDictionary *) solarHolidayHK
{
    if (!_solarHolidayHK)
        _solarHolidayHK = @{@"0101":NSLocalizedString(@"元旦",""),
                            @"0214":NSLocalizedString(@"情人节",""),
                            @"0308":NSLocalizedString(@"妇女节",""),
                            @"0501":NSLocalizedString(@"劳动节",""),
                            @"0601":NSLocalizedString(@"儿童节",""),
                            @"0701":NSLocalizedString(@"特区紀念日", ""),
                            @"1001":NSLocalizedString(@"国庆节",""),
                            @"1225":NSLocalizedString(@"圣诞节","")
                            };
    return _solarHolidayHK;
}

- (NSDictionary *) solarHolidayTW
{   if (!_solarHolidayTW)
    _solarHolidayTW = @{@"0101":NSLocalizedString(@"开国纪念日",""),
                        @"0214":NSLocalizedString(@"情人节",""),
                        @"0228":NSLocalizedString(@"和平纪念日",""),
                        @"0308":NSLocalizedString(@"妇女节",""),
                        @"0501":NSLocalizedString(@"劳动节",""),
                        @"0601":NSLocalizedString(@"儿童节",""),
                        @"0903":NSLocalizedString(@"军人节", ""),
                        @"1010":NSLocalizedString(@"中华民国国庆日",""),
                        @"1225":NSLocalizedString(@"圣诞节","")
                        };
    return _solarHolidayTW;
}


// TODO: US holiday needs some algorithm...

// 1. Third Monday in January, Birthday of Dr. Martin Luther King, Jr.
// 2. 2月的第三個星期一, Washington's Birthday/Presidents' Day
// 3. Last Monday in May	Memorial Day
// 4. First Monday in Septembe Labor Day
// 5. Second Monday in October Columbus Day
// 6. 11月的第四個星期四 Thanksgiving Day
- (NSDictionary *) solarHolidayUS
{   if (!_solarHolidayUS)
    _solarHolidayUS = @{@"0101":NSLocalizedString(@"New Year's Day",""),
                        @"0214":NSLocalizedString(@"Valentine",""),
                        @"0704":NSLocalizedString(@"Independence Day",""),
                        @"1111":NSLocalizedString(@"Veterans Day", ""),
                        @"1225":NSLocalizedString(@"Christmas Day","")
                        };
    return _solarHolidayUS;
}

// 1. 耶稣受难日
// 2. 9月第一個星期一 劳工节

- (NSDictionary *) solarHolidayCA
{
    if (!_solarHolidayCA)
        _solarHolidayCA = @{@"0101":NSLocalizedString(@"New Year's Day",""),
                            @"0214":NSLocalizedString(@"Valentine",""),
                            @"0701":NSLocalizedString(@"Canada Day",""),
                            @"1111":NSLocalizedString(@"Remembrance Day",""),
                            @"1225":NSLocalizedString(@"Christmas Day",""),
                            @"1226":NSLocalizedString(@"Boxing Day","")
                            };
    return _solarHolidayCA;

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


- (NSArray *) getHolidayListWithDate: (NSDate *)date {
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
