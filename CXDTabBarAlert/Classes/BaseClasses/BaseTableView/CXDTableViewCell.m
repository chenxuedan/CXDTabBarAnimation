//
//  CXDTableViewCell.m
//  Schedule
//
//  Created by chenxuedan on 2018/9/3.
//  Copyright © 2018年 cxd. All rights reserved.
//

#import "CXDTableViewCell.h"

@implementation CXDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)view).delaysContentTouches = NO;//Remove touch delay for iOS 7
            break;
        }
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
