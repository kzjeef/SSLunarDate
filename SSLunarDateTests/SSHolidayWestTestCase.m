//
//  SSHolidayWestTestCase.m
//  ShiftScheduler
//
//  Created by Jiejing Zhang on 13-8-20.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "SSHolidayWest.h"

@interface SSHolidayWestTestCase : SenTestCase

@end

@implementation SSHolidayWestTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void) isDateEqual: (int) year month:(int) month day:(int) day withDate: (NSDate*) date
{
    NSDateComponents *c = [NSDateComponents new];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSTimeZone *tz = [[NSTimeZone alloc] initWithName:@"PDT"];
    c = [cal components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date];
    [c setTimeZone:tz];
    
    STAssertEquals(c.year, year, @"year not equal");
    STAssertEquals(c.month, month, @"month not equal");
    STAssertEquals(c.day, day, @"day not equal");
}

- (void)testHoliday
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterFullStyle];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setCalendar:[NSCalendar currentCalendar]];
    
    SSHolidayWest *h = [SSHolidayWest new];
    
    STAssertNotNil([h getColumbusDay:2013], @"get holiday null");
    
    NSLog(@"2013 ColumbusDay:%@", [formatter stringFromDate:[h getColumbusDay:2013]]);
    [self isDateEqual:2013 month:10 day:14 withDate:[h getColumbusDay:2013]];
    NSLog(@"2013 Easter Day: %@", [formatter stringFromDate:[h getEaster:2013]]);
    [self isDateEqual:2013 month:3 day:31 withDate:[h getEaster:2013]];

    NSLog(@"2013 Easter Monday: %@", [formatter stringFromDate:[h getEasterMonday:2013]]);
    [self isDateEqual:2013 month:4 day:1 withDate:[h getEasterMonday:2013]];

    NSLog(@"2013 GoodFirday Day: %@", [formatter stringFromDate:[h getGoodFriday:2013]]);
    [self isDateEqual:2013 month:3 day:29 withDate:[h getGoodFriday:2013]];
    
    NSLog(@"2013 Labor Day: %@", [formatter stringFromDate:[h getLaborDay:2013]]);
    [self isDateEqual:2013 month:9 day:2 withDate:[h getLaborDay:2013]];

    NSLog(@"2013 Martin Day: %@", [formatter stringFromDate:[h getMartinLutherKingBirthday:2013]]);
    [self isDateEqual:2013 month:1 day:21 withDate:[h getMartinLutherKingBirthday:2013]];
    
    NSLog(@"2013 Memorial Day: %@", [formatter stringFromDate:[h getMemorialDay:2013]]);
    [self isDateEqual:2013 month:5 day:27 withDate:[h getMemorialDay:2013]];

    NSLog(@"2013 Wasonton Day: %@", [formatter stringFromDate:[h getPresidentsDay:2013]]);
    [self isDateEqual:2013 month:2 day:18 withDate:[h getPresidentsDay:2013]];
    
    NSLog(@"2013 ThanksGiving Day: %@", [formatter stringFromDate:[h getThanksGivingDay:2013]]);
    [self isDateEqual:2013 month:11 day:28 withDate:[h getThanksGivingDay:2013]];
}

@end
