//
//  ZQContentCell.h
//  ZQDialogViewer
//
//  Created by Joyce on 17/12/12.
//  Copyright © 2017年 Joyce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQContentCell : UICollectionViewCell

/** label */
@property(nonatomic, strong)UILabel *label;
/** text */
@property(nonatomic, copy)NSString *text;

+ (CGSize)sizeForContentString:(NSString *)s;

@end
