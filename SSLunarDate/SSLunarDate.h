//
//  SSLunarDate.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-6.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SSLunarDateFormatter.h"
#import "SSLunarDateType.h"
#import "SSHolidayManager.h"

@interface SSLunarDate : NSObject

// init the solar date by [NSDate date];
- (id) init;

// init with solarDate
- (id) initWithDate:(NSDate *) solarDate;

// This with date and calendar.
// The calendar is because the calendar generate function is very heavy,
// so better can use a parameter to have the calendar.
- (id) initWithDate:(NSDate *)solarDate calendar:(NSCalendar *)calendar;

// Check whether the solar to lunar success or not, since the lunar convert
// have some range, the out ranged date will lead to empty string for the
// string functions.
- (BOOL) convertSuccess;


- (NSString *) monthString;
- (NSString *) dayString;
- (NSString *) zodiacString;
- (NSString *) string;
- (NSString *) yearGanzhiString;

- (BOOL)       isLeapMonth;  // return whether the date is a leap month.
- (NSString *) leapString;


- (BOOL)       isLunarHolidayWithRegion:(SSHolidayRegion) region;
- (NSString *) getLunarHolidayNameWithRegion:(SSHolidayRegion) region;





// needs: 1. needs get the lunar date by a lunar date.
//        2. can get the string of date, to show on the calendar.
//        3. can show lunar holiday on the calendar.
//        4. the string must be i18n able, this is important for Hongko, Taiwan customer.


@end
