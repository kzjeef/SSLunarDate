//
//  SSHolidayTests.m
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-21.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import "SSHolidayTests.h"
#import "SSHolidayManager.h"

@implementation SSHolidayTests

- (void)setUp
{
    [super setUp];
}

- (void) tearDown
{
    [super tearDown];
}

- (NSDate *) getDateByYear: (int) year month:(int) month day:(int)day
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *thedate = [[NSDateComponents alloc] init];
    [thedate setYear:year];
    [thedate setMonth:month];
    [thedate setDay:day];
    
    return [cal dateFromComponents:thedate];
}

- (void) dotestHolidayOf: (SSHolidayManager *) manager  year:(int) year month: (int) month day:(int) day name:(NSString *) name
{
    NSDate *d = [self getDateByYear:year month:month day:day];
    NSArray *a = [manager getHolidayListForDate:d];
    
    NSLog(@"holiday at %d-%d-%d is %@", year, month, day, a);
    
    if (name == nil) {
        STAssertNil(a, @"no holiday");
    } else {
        NSLog(@"assume %@", name);
        STAssertNotNil(a, @"have holiday");
        STAssertTrue([[a lastObject] isEqualToString:name],
                     @"holiday not corrent ");
    }
}

- (void) testHolidayManagerChina
{
    SSHolidayManager *holidaym = [[SSHolidayManager alloc] initWithRegion:SSHolidayRegionChina];
    
    [self dotestHolidayOf:holidaym year:2013 month:1 day:1 name:@"元旦"];
    [self dotestHolidayOf:holidaym year:2013 month:2 day:14 name:@"情人节"];
    [self dotestHolidayOf:holidaym year:2013 month:2 day:15 name:nil];
    [self dotestHolidayOf:holidaym year:2013 month:3 day:8 name:@"妇女节"];
    [self dotestHolidayOf:holidaym year:2013 month:12 day:25 name:@"圣诞节"];
    [self dotestHolidayOf:holidaym year:2013 month:2 day:9 name:@"除夕" ];
    [self dotestHolidayOf:holidaym year:2013 month:2 day:10 name:@"春节"];
}

@end
