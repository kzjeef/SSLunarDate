//
//  SSLunarDateFormatter.m
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-7.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#import "SSLunarDateFormatter.h"

#define YEAR_STR NSLocalizedString(@"年", "year")

@interface SSLunarDateFormatter()
{
    NSArray *_monthArray;
    NSArray *_dayArray;
    NSArray *_ganArray;
    NSArray *_zhiArray;
    NSArray *_zodiacArray;
    NSArray *_solarTerm;
    NSDictionary *_solarHoliday; // chinese only.
    NSDictionary *_lunarHoliday;
}
@end


static SSLunarDateFormatter  *_sharedFormatter = NULL;

@implementation SSLunarDateFormatter

+ (SSLunarDateFormatter *)sharedLunarDateFormatter
{
    @synchronized([SSLunarDateFormatter class]) {
        if (!_sharedFormatter)
            _sharedFormatter = [[self alloc] init];
        return _sharedFormatter;
    }
    return nil;
}

+ (id) alloc
{
    @synchronized([SSLunarDateFormatter class]) {
        NSAssert(_sharedFormatter == NULL, @"attempt to alloc a second SharedLunarDateFormatter");
        _sharedFormatter = [super alloc];
        return _sharedFormatter;
    }
    return nil;
}

- (NSArray *) monthArray
{
    if (!_monthArray)
        _monthArray = @[
        NSLocalizedString(@"正月",""),
        NSLocalizedString(@"二月",""),
        NSLocalizedString(@"三月",""),
        NSLocalizedString(@"四月",""),
        NSLocalizedString(@"五月",""),
        NSLocalizedString(@"六月",""),
        NSLocalizedString(@"七月",""),
        NSLocalizedString(@"八月",""),
        NSLocalizedString(@"九月",""),
        NSLocalizedString(@"十月",""),
        NSLocalizedString(@"十一月",""),
        NSLocalizedString(@"腊月","")];

    return _monthArray;
}

- (NSArray *) dayArray
{
    if (!_dayArray)
        _dayArray = @[
        NSLocalizedString(@"初一",""),
        NSLocalizedString(@"初二",""),
        NSLocalizedString(@"初三",""),
        NSLocalizedString(@"初四",""),
        NSLocalizedString(@"初五",""),
        NSLocalizedString(@"初六",""),
        NSLocalizedString(@"初七",""),
        NSLocalizedString(@"初八",""),
        NSLocalizedString(@"初九",""),
        NSLocalizedString(@"初十",""),
        NSLocalizedString(@"十一",""),
        NSLocalizedString(@"十二",""),
        NSLocalizedString(@"十三",""),
        NSLocalizedString(@"十四",""),
        NSLocalizedString(@"十五",""),
        NSLocalizedString(@"十六",""),
        NSLocalizedString(@"十七",""),
        NSLocalizedString(@"十八",""),
        NSLocalizedString(@"十九",""),
        NSLocalizedString(@"二十",""),
        NSLocalizedString(@"廿一",""),
        NSLocalizedString(@"廿二",""),
        NSLocalizedString(@"廿三",""),
        NSLocalizedString(@"廿四",""),
        NSLocalizedString(@"廿五",""),
        NSLocalizedString(@"廿六",""),
        NSLocalizedString(@"廿七",""),
        NSLocalizedString(@"廿八",""),
        NSLocalizedString(@"廿九",""),
        NSLocalizedString(@"三十","")];
    
    return _dayArray;
}

- (NSArray *) ganArray
{
    if (!_ganArray)
        _ganArray = @[
        NSLocalizedString(@"甲",""),
        NSLocalizedString(@"乙",""),
        NSLocalizedString(@"丙",""),
        NSLocalizedString(@"丁",""),
        NSLocalizedString(@"戊",""),
        NSLocalizedString(@"己",""),
        NSLocalizedString(@"庚",""),
        NSLocalizedString(@"辛",""),
        NSLocalizedString(@"壬",""),
        NSLocalizedString(@"癸","")];
    return _ganArray;
}

- (NSArray *) zhiArray
{
    if (!_zhiArray)
        _zhiArray = @[
        NSLocalizedString(@"子",""),
        NSLocalizedString(@"丑",""),
        NSLocalizedString(@"寅",""),
        NSLocalizedString(@"卯",""),
        NSLocalizedString(@"辰",""),
        NSLocalizedString(@"巳",""),
        NSLocalizedString(@"午",""),
        NSLocalizedString(@"未",""),
        NSLocalizedString(@"申",""),
        NSLocalizedString(@"酉",""),
        NSLocalizedString(@"戌",""),
        NSLocalizedString(@"亥","")];
    return _zhiArray;
}

- (NSArray *) zodiacArray
{
    if (!_zodiacArray)
        _zodiacArray = @[
        NSLocalizedString(@"鼠",""),
        NSLocalizedString(@"牛",""),
        NSLocalizedString(@"虎",""),
        NSLocalizedString(@"兔",""),
        NSLocalizedString(@"龙",""),
        NSLocalizedString(@"蛇",""),
        NSLocalizedString(@"马",""),
        NSLocalizedString(@"羊",""),
        NSLocalizedString(@"猴",""),
        NSLocalizedString(@"鸡",""),
        NSLocalizedString(@"狗",""),
        NSLocalizedString(@"猪","")];
    return _zodiacArray;
}

- (NSArray *) solarTerm
{
    if (!_solarTerm)
        _solarTerm = @[
        NSLocalizedString(@"立春",""),
        NSLocalizedString(@"雨水",""),
        NSLocalizedString(@"清明",""),
        NSLocalizedString(@"春分",""),
        NSLocalizedString(@"惊蛰",""),
        NSLocalizedString(@"谷雨",""),
        NSLocalizedString(@"立夏",""),
        NSLocalizedString(@"小满",""),
        NSLocalizedString(@"芒种",""),
        NSLocalizedString(@"夏至",""),
        NSLocalizedString(@"小暑",""),
        NSLocalizedString(@"大暑",""),
        NSLocalizedString(@"立秋",""),
        NSLocalizedString(@"处暑",""),
        NSLocalizedString(@"白露",""),
        NSLocalizedString(@"秋分",""),
        NSLocalizedString(@"寒露",""),
        NSLocalizedString(@"霜降",""),
        NSLocalizedString(@"立冬",""),
        NSLocalizedString(@"小雪",""),
        NSLocalizedString(@"大雪",""),
        NSLocalizedString(@"冬至",""),
        NSLocalizedString(@"小寒",""),
        NSLocalizedString(@"大寒","")];

    return _solarTerm;
}

- (NSDictionary *) solarHoliday
{
    if (!_solarHoliday)
        _solarHoliday = @{@"0101":NSLocalizedString(@"元旦",""),
        @"0214":NSLocalizedString(@"情人节",""),
    @"0308":NSLocalizedString(@"妇女节",""),
    @"0312":NSLocalizedString(@"植树节",""),
    @"0401":NSLocalizedString(@"愚人节",""),
    @"0501":NSLocalizedString(@"劳动节",""),
    @"0504":NSLocalizedString(@"青年节",""),
    @"0601":NSLocalizedString(@"儿童节",""),
    @"0701":NSLocalizedString(@"建党节",""),
    @"0801":NSLocalizedString(@"建军节",""),
    @"0910":NSLocalizedString(@"教师节",""),
    @"1001":NSLocalizedString(@"国庆节",""),
    @"1225":NSLocalizedString(@"圣诞节","")
        };

    return _solarHoliday;
}

- (NSDictionary *) lunarHoliday
{
    if (!_lunarHoliday)
        _lunarHoliday = @{ @"0101":NSLocalizedString(@"春节",""),
          @"0115":NSLocalizedString(@"元宵",""),
          /* TODO deal with "清明","") */
          @"0505":NSLocalizedString(@"端午",""),
          @"0707":NSLocalizedString(@"七夕",""),
          @"0815":NSLocalizedString(@"中秋",""),
          @"0909":NSLocalizedString(@"重阳",""),
          @"1208":NSLocalizedString(@"腊八","")
        };

    return _lunarHoliday;
}

- (NSString *) getGanZhiNameForDate:(LibLunarContext *)lunar
{
    NSAssert(lunar != NULL, @"lunar not be null");
    
    return [NSString  stringWithFormat:@"%@%@",
            [self ganArray][lunar->_gan.year],
            [self zhiArray][lunar->_zhi.year]];
}

- (NSString *) getShengXiaoNameForDate:(LibLunarContext *)lunar
{
    NSAssert(lunar != NULL, @"lunar should not null");
    return [self zodiacArray][lunar->_zhi.year];
}

- (NSString *) getLunarMonthForDate: (LibLunarContext *) lunar
{
    NSAssert(lunar != NULL, @"lunar should not null");

    return [self monthArray][lunar->_lunar.month - 1];
}

- (NSString *) getDayNameForDate: (LibLunarContext *) lunar
{
    NSAssert(lunar != NULL, @"lunar should not null");
    return [self dayArray][lunar->_lunar.day - 1];
}

- (NSString *) getFullLunarStringForDate: (LibLunarContext *) lunar
{
    NSAssert(lunar != NULL, @"lunar should not null");

    return [NSString stringWithFormat:@"%@%@%@%@", [self getGanZhiNameForDate:lunar],
    YEAR_STR, [self getLunarMonthForDate:lunar],
     [self getDayNameForDate:lunar] ];
    
}

- (BOOL) isDateLunarHoliday:(LibLunarContext *) lunar
{
    NSAssert(lunar != NULL, @"lunar should not null");
}

- (NSString *) getLunarHolidayNameForDate: (LibLunarContext *) lunar
{
    NSAssert(lunar != NULL, @"lunar should not null");
}

- (BOOL) isLeapMonthForDate: (LibLunarContext *) lunar
{
        NSAssert(lunar != NULL, @"lunar should not null");
        return lunar->_lunar.leap == 1;
}

@end
