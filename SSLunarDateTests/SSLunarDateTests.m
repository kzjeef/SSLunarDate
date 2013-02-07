//
//  SSLunarDateTests.m
//  SSLunarDateTests
//
//  Created by Jiejing Zhang on 13-2-6.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import "SSLunarDateTests.h"
#import "SSLunarDate.h"


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
    [lunar printLunarDay:[NSDate date]];
}

@end
