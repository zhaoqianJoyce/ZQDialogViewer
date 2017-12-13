//
//  ZQHeadCell.m
//  ZQDialogViewer
//
//  Created by Joyce on 17/12/12.
//  Copyright © 2017年 Joyce. All rights reserved.
//

#import "ZQHeaderCell.h"

@implementation ZQHeaderCell

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.label.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.8 alpha:1.0];
        self.label.textColor = [UIColor blackColor];
    }
    return self;
}

+ (UIFont *)defaultFont{

    return [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}
@end
