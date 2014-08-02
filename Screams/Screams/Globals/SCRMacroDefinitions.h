//
//  SCRMacroDefinitions.h
//  Screams
//
//  Created by Administrator on 8/2/14.
//  Copyright (c) 2014 SCR. All rights reserved.
//

#ifndef SCR_MacroDefenitions_h
#define SCR_MacroDefenitions_h

//COLORS
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:1.0]

#define UI_COLOR_CLEARCOLOR [UIColor clearColor]
#define UI_COLOR_MEDIUM_GREY UIColorFromRGB(0x9B9EA3)
#define UI_COLOR_PLACEHOLDER_TEXT UIColorFromRGB(0xFFFFFF)

#define UI_COLOR_SCREAMIN_BUTTON UI_COLOR_CLEARCOLOR
#define UI_COLOR_SCREAMIN_BUTTON1 UIColorFromRGB(0x7A0F15)
#define UI_COLOR_SCREAMIN_BUTTON2 UIColorFromRGB(0x510001)
#define UI_COLOR_SCREAMIN_BUTTON3 UIColorFromRGB(0x920000)
#define UI_COLOR_SCREAMIN_BUTTON4 UIColorFromRGB(0xBD1111)

////The color of the button can be #7A0F15 or #510001 or #920000 or #BD1111



#define IS_IPHONE_4Inch ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.0)

#define KEYBOARD_VARIATION_LOGIN_SCREEN 40
/*
 Make it a method in future
- (BOOL)hasFourInchDisplay {
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568.0);
}
*/
#endif