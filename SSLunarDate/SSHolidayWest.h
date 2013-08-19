//
//  SSHolidayWest.h
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


@interface SSHolidayWest : NSObject

- (NSDate *) getEaster: (int) year;
- (NSDate *) getGoodFriday: (int) year;
- (NSDate *) getGoodFirdayNextDay: (int) year;
- (NSDate *) getMartinLutherKingBirthday: (int) year;
- (NSDate *) getPresidentsDay: (int) year;
- (NSDate *) getMemorialDay: (int) year;
- (NSDate *) getLaborDay: (int) year;
- (NSDate *) getColumbusDay: (int) year;
- (NSDate *) getThanksGivingDay: (int) year;

@end
