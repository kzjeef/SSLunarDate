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

- (void)testHoliday
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterFullStyle];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setCalendar:[NSCalendar currentCalendar]];
    
    SSHolidayWest *h = [SSHolidayWest new];
    
    STAssertNotNil([h getColumbusDay:2013], @"get holiday null");
    NSLog(@"2013 ColumbusDay:%@", [formatter stringFromDate:[h getColumbusDay:2013]]);
    NSLog(@"2013 Easter Day: %@", [formatter stringFromDate:[h getEaster:2013]]);
    NSLog(@"2013 GoodFirday Day: %@", [formatter stringFromDate:[h getGoodFriday:2013]]);
    NSLog(@"2013 Labor Day: %@", [formatter stringFromDate:[h getLaborDay:2013]]);
    NSLog(@"2013 Martin Day: %@", [formatter stringFromDate:[h getMartinLutherKingBirthday:2013]]);
    NSLog(@"2013 Memorial Day: %@", [formatter stringFromDate:[h getMemorialDay:2013]]);
    NSLog(@"2013 Wasonton Day: %@", [formatter stringFromDate:[h getPresidentsDay:2013]]);
    NSLog(@"2013 ThanksGiving Day: %@", [formatter stringFromDate:[h getThanksGivingDay:2013]]);
    

}

@end
