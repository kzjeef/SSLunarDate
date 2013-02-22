//
//  SSLunarDateHoliday.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-20.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SSLunarDate.h"
#import "SSHolidayManager.h"
#import "libLunar.h"



@interface SSLunarDateHoliday : NSObject

+(id) sharedSSLunarDateHoliday;

- (NSString *) getQingmingDate: (int) solarYear;

- (NSString *) getDongzhiDate: (int) solarYear;

- (BOOL) isDateLunarHoliday:(LibLunarContext *) lunar region:(SSHolidayRegion) region;

- (NSString *) getLunarHolidayNameForDate: (LibLunarContext *) lunar region:(SSHolidayRegion) region;

+ (NSString *) convertIndexFrom:(int) month day: (int) day;

@end
