//
//  SSHolidayManager.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-20.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SSHolidayRegionChina = 0,
    SSHolidayRegionHongkong,
    SSHolidayRegionMocao,
    SSHolidayRegionTaiwan,
    SSHolidayRegionUS,
    SSholidayRegionCanadia,
} SSHolidayRegion;


// This class manage the solar holiday of selected region.
// Majoy of the holiday day is calc by some rules in WiKi,
// But for some unknow holiday, such as China off day, which will
// update every year, so this should be fetch from network. 
@interface SSHolidayManager : NSObject

- initWithRegion:(SSHolidayRegion) region;

- (NSArray *) getHolidayListForDate:(NSDate *)date;


@end
