//
//  SSLunarDateType.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-7.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#ifndef SSLunarDate_SSLunarDateType_h
#define SSLunarDate_SSLunarDateType_h

typedef struct {
    int year, month, day, hour, weekday;
    int leap;	/* the lunar month is a leap month */
} SSLunarSimpleDate;

#define Cyear	1900	/* Note that LC1900.1.1 is SC1900.1.31 */
#define Nyear	150	/* number of years covered by the table */
#define Nmonth  13	/* maximum number of months in a lunar year */


typedef struct LibLunarContext {
    SSLunarSimpleDate _solar;
    SSLunarSimpleDate _lunar;
    SSLunarSimpleDate _gan;
    SSLunarSimpleDate _zhi;
    SSLunarSimpleDate _gan2;
    SSLunarSimpleDate _zhi2;
    SSLunarSimpleDate _lunar2;
    int _ymonth[Nyear];
    int _yday[Nyear];
    int _mday[Nmonth + 1];
    int _jieAlert;
} LibLunarContext;

#endif
