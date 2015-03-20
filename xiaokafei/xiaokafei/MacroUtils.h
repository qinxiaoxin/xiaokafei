//
//  MacroUtils.h
//  xiaokafei
//
//  Created by Xin Qin on 1/30/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#ifndef xiaokafei_MacroUtils_h
#define xiaokafei_MacroUtils_h


#endif

#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

#define EMPTY_STRING        @""

#define STR(key)            NSLocalizedString(key, nil)

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 *  Distance
 */

#define LIST_VIEW_BUTTON_WIDTH                 800.f
#define LIST_VIEW_BUTTON_HEIGHT                100.f


#define RECTANGLE_WIDTH                        1000.f
#define RECTANGLE_HEIGHT                       500.f

#define RECTANGLE_BORDER_WIDTH                  15.f

#define SHADOW_RADIUS                           20.f

#define SCREEN_WIDTH                            [[UIScreen mainScreen] applicationFrame].size.width
#define SCREEN_HEIGHT                           [[UIScreen mainScreen] applicationFrame].size.height

#define MY_ORDER_BUTTON_DIAMETER                100


/**
*   Color
*/
#define RGBA(r,g,b,a)  [UIColor colorWithRed:(float)r/255.f green:(float)g/255.f blue:(float)b/255.f  alpha:a]


/**
*   Font
*/

#define Font                               @"MINIj4gj"