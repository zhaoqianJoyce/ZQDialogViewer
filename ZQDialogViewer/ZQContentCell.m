//
//  ZQContentCell.m
//  ZQDialogViewer
//
//  Created by Joyce on 17/12/12.
//  Copyright © 2017年 Joyce. All rights reserved.
//

#import "ZQContentCell.h"

@implementation ZQContentCell

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.label.opaque = NO;
        self.label.backgroundColor = [UIColor redColor];
        self.label.textColor = [UIColor blackColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [[self class] defaultFont];
        [self.contentView addSubview:self.label];
    }
    return self;
}

+ (UIFont *)defaultFont{

    return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

+ (CGSize)sizeForContentString:(NSString *)s{

    CGSize maaxSize = CGSizeMake(300, 1000);
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [self defaultFont],
                                 NSParagraphStyleAttributeName : style
                                 };
    CGRect rect = [s boundingRectWithSize:maaxSize options:opts attributes:attributes context:nil];
    return rect.size;
}

- (NSString *)text{

    return self.label.text;
}

- (void)setText:(NSString *)text{

    self.label.text = text;
    CGRect newLabelFrame = self.label.frame;
    CGRect newContentFrame = self.contentView.frame;
    CGSize textSize = [[self class] sizeForContentString:text];
    newLabelFrame.size = textSize;
    newContentFrame.size = textSize;
    self.label.frame = newLabelFrame;
    self.contentView.frame = newContentFrame;
}
@end
