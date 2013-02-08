//
//  libLunar.h
//  SSLunarDate
//
//  Created by Jiejing Zhang on 13-2-6.
//  Copyright (c) 2013年 Jiejing Zhang. All rights reserved.
//

#ifndef SSLunarDate_libLunar_h
#define SSLunarDate_libLunar_h

#include "SSLunarDateType.h"



void Lunar2Solar(struct LibLunarContext *ctx, Date *lunar);
void Solar2Lunar(struct LibLunarContext *ctx, Date *solar);
Date *getLunarDate(LibLunarContext *ctx);
Date *getSolarDate(LibLunarContext *ctx);

LibLunarContext * createLunarContext();
void  freeLunarContext(struct LibLunarContext *context);


#endif
