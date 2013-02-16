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

@interface SSLunarDate : NSObject
- (id) init; // init the solar date by [NSDate date];
- (id) initWithDate:(NSDate *) solarDate; // init with solarDate

- (NSString *) monthString;
- (NSString *) dayString;
- (NSString *) zodiacString;
- (NSString *) string;
- (NSString *) yearGanzhiString;
- (NSString *) leapString;
- (BOOL)       isLeapMonth;  // return whether the date is a leap month.



// needs: 1. needs get the lunar date by a lunar date.
//        2. can get the string of date, to show on the calendar.
//        3. can show lunar holiday on the calendar.
//        4. the string must be i18n able, this is important for Hongko, Taiwan customer.


@end
