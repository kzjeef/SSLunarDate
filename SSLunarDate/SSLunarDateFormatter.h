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

+ (SSLunarDateFormatter *)sharedLunarDateFormatter;

- (NSString *) getGanZhiNameForDate:(LibLunarContext *)lunar;

- (NSString *) getShengXiaoNameForDate:(LibLunarContext *)lunar;

- (NSString *) getGanZhiYearNameForDate:(LibLunarContext *)lunar;

- (NSString *) getLunarMonthForDate: (LibLunarContext *) lunar;

- (NSString *) getDayNameForDate: (LibLunarContext *) lunar;

- (NSString *) getFullLunarStringForDate: (LibLunarContext *) lunar;

- (BOOL)       isDateLunarHoliday:(LibLunarContext *) lunar;

- (NSString *) getLunarHolidayNameForDate: (LibLunarContext *) lunar;

- (BOOL)       isLeapMonthForDate: (LibLunarContext *) lunar;

- (NSString *) getLeapString;




@end
