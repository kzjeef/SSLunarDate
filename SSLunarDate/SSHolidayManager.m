//
//  SSHolidayManager.m
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-20.
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

#import "SSHolidayManager.h"
#import "SSLunarDate.h"
#import "SSHolidayTable.h"


@interface SSHolidayManager ()
{
    SSHolidayRegion _region;
    SSHolidayTable  *_table;
    NSCalendar     *_calendar;
    
}
@end

@implementation SSHolidayManager

- (id) init
{
    self = [super init];
    if (self) {
        _region = SSHolidayRegionChina;
        _calendar = [NSCalendar currentCalendar];
        _table = [[SSHolidayTable alloc] initWithRegion:_region calendar:_calendar];
    }
    return self;
}

- (id) initWithRegion:(SSHolidayRegion)region
{
    self = [super init];
    if (self) {
        _region = region;
        _calendar = [NSCalendar currentCalendar];
        _table = [[SSHolidayTable alloc] initWithRegion:_region calendar:_calendar];
    }
    return self;
}

- (NSArray *) getHolidayListForDate:(NSDate *)date
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if (_region >= SSHolidayRegionChina && _region <= SSHolidayRegionTaiwan) {
        // For those region, we needs to deal with lunar holiday.
        SSLunarDate *lunarDate = [[SSLunarDate alloc] initWithDate:date calendar:_calendar];
        if ([lunarDate isLunarHolidayWithRegion:_region])
            [result addObject:[lunarDate getLunarHolidayNameWithRegion:_region]];
    }
    
    
     NSArray *a = [_table getHolidayListWithDate:date];
    if ([a lastObject] != nil)
        [result addObjectsFromArray:a];
    
    if ([result  lastObject] == nil)
        return  nil;
    else
        return result;
}


@end
