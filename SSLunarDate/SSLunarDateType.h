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
} Date;

#endif
