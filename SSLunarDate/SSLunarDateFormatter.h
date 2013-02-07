//
//  SSLunarDateFormatter.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-7.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSLunarDate.h"
#import "libLunar.h"

@interface SSLunarDateFormatter : NSObject

+ (NSString *) getGanZhiNameForDate:(Date *)lunar;

+ (NSString *) getShengXiaoNameForDate:(Date *)lunar;

+ (NSString *) getYearNameForDate:(Date *) lunar;

+ (NSString *) getLunarMonthForDate: (Date *) lunar;

+ (NSString *) getDayNameForDate: (Date *) lunar;

+ (NSString *) getFullLunarStringForDate: (Date *) lunar;

+ (BOOL)       isDateLunarHoliday:(Date *) lunar;

+ (NSString *) getLunarHolidayNameForDate: (Date *) lunar;

+ (BOOL)       isLeapMonthForDate: (Date *) lunar;


@end
