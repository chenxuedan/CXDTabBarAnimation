//
//  CXDTableViewCell.h
//  Schedule
//
//  Created by chenxuedan on 2018/9/3.
//  Copyright © 2018年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZXYBindingCellWithNativeModel <NSObject>

@optional

- (void)bindingCellWithNativeModel:(id)model;

@end

@interface CXDTableViewCell : UITableViewCell <ZXYBindingCellWithNativeModel>


@end
