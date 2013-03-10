//
//  SSHolidayTable.h
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

#import <Foundation/Foundation.h>
#import "SSHolidayManager.h"

// This class is mainly deal with the holiday in solar for each region.
@interface SSHolidayTable : NSObject

- (id) initWithRegion:(SSHolidayRegion) region calendar:(NSCalendar *)calendar;

- (NSArray *) getHolidayListWithDate:(NSDate *)date;

@end
