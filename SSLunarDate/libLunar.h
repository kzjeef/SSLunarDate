//
//  libLunar.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-6.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#ifndef SSLunarDate_libLunar_h
#define SSLunarDate_libLunar_h

#define Cyear	1900	/* Note that LC1900.1.1 is SC1900.1.31 */
#define Nyear	150	/* number of years covered by the table */
#define Nmonth  13	/* maximum number of months in a lunar year */

#include "SSLunarDateType.h"

typedef struct LibLunarContext {
    Date _solar;
    Date _lunar;
    Date _gan;
    Date _zhi;
    Date _gan2;
    Date _zhi2;
    Date _lunar2;
    int _ymonth[Nyear];
    int _yday[Nyear];
    int _mday[Nmonth + 1];
    int _jieAlert;
} LibLunarContext;



void Lunar2Solar(struct LibLunarContext *ctx, Date *lunar);
void Solar2Lunar(struct LibLunarContext *ctx, Date *solar);
Date *getLunarDate(LibLunarContext *ctx);
Date *getSolarDate(LibLunarContext *ctx);

LibLunarContext * createLunarContext();
void  freeLunarContext(struct LibLunarContext *context);


#endif
