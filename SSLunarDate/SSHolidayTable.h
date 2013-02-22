//
//  SSHolidayTable.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-21.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSHolidayManager.h"

// This class is mainly deal with the holiday in solar for each region.
@interface SSHolidayTable : NSObject

- (id) initWithRegion:(SSHolidayRegion) region calendar:(NSCalendar *)calendar;

- (NSArray *) getHolidayListWithDate:(NSDate *)date;

@end
