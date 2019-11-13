//
//  CXDKitMacro.h
//  CodePackaging
//
//  Created by xiao zude on 2019/2/26.
//  Copyright © 2019年 cxd. All rights reserved.
//

#ifndef CXDKitMacro_h
#define CXDKitMacro_h

/**
 Add this macro before each category implementation, so we don't have to use
 -all_load or -force_load to load object files from static libraries that only
 contain categories and no classes.
 More info: http://developer.apple.com/library/mac/#qa/qa2006/qa1490.html .
 *******************************************************************************
 Example:
 YYSYNTH_DUMMY_CLASS(NSString_YYAdd)
 */
#ifndef CXDSYNTH_DUMMY_CLASS
#define CXDSYNTH_DUMMY_CLASS(_name_) \
@interface CXDSYNTH_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation CXDSYNTH_DUMMY_CLASS_ ## _name_ @end
#endif


#endif /* CXDKitMacro_h */
