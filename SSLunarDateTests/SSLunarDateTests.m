//
//  SSLunarDateTests.m
//  SSLunarDateTests
//
//  Created by Jiejing Zhang on 13-2-6.
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

#import "SSLunarDateTests.h"
#import "SSLunarDate.h"
#import "SSLunarDateFormatter.h"
#import "SSLunarDateHoliday.h"


@implementation SSLunarDateTests
- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void) testPrintTodayLunar
{
    SSLunarDate *lunar = [[SSLunarDate alloc] init];

    NSLog(@"month:%@ day:%@", [lunar monthString], [lunar dayString]);
    
    NSLog(@"full string:%@ %@", [lunar string], [lunar zodiacString]);
    
}

- (void) testQingming
{
    SSLunarDateHoliday *holiday = [SSLunarDateHoliday sharedSSLunarDateHoliday];
    
    NSLog(@"2013 qingming: %@", [holiday getQingmingDate:2013]);
    

    STAssertTrue([@"0405" isEqualToString:[holiday getQingmingDate:2010]] , @"qingming calc not good");
    STAssertTrue([@"0405" isEqualToString:[holiday getQingmingDate:2011]] , @"qingming calc not good");
    STAssertTrue([@"0404" isEqualToString:[holiday getQingmingDate:2013]] , @"qingming calc not good");
    STAssertTrue([@"0404" isEqualToString:[holiday getQingmingDate:2013]] , @"qingming calc not good");
}

- (void) testDongzhi
{
    SSLunarDateHoliday *holiday = [SSLunarDateHoliday sharedSSLunarDateHoliday];
    
    STAssertTrue([@"1221" isEqualToString:[holiday getDongzhiDate:2012]], @"dongzhi calc not good");
    STAssertTrue([@"1222" isEqualToString:[holiday getDongzhiDate:2013]], @"dongzhi calc not good");
}

@end
