//
//  ViewController.m
//  ZQDialogViewer
//
//  Created by Joyce on 17/12/12.
//  Copyright © 2017年 Joyce. All rights reserved.
//

#import "ViewController.h"
#import "ZQContentCell.h"
#import "ZQHeaderCell.h"

@interface ViewController ()

/** sections */
@property(nonatomic, copy)NSArray *sections;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sections = @[
                      @{ @"header" : @"First Witch",
                         @"content" : @"Hey, when will the three of us meet up later?"
                        },
                      @{ @"header" : @"Second Witch",
                         @"content" : @"When eveything's straightened out."
                        },
                      @{ @"header" : @"Third Witch",
                         @"content" : @"That'll be just before sunset."
                        },
                      @{ @"header" : @"First Witch",
                         @"content" : @"Where?"
                        },
                      @{ @"header" : @"Second Witch",
                         @"content" : @"The dirt patch"
                        },
                      @{ @"header" : @"Third Witch",
                         @"content" : @"I guess we'll see Mac there."
                        },
                      ];
    [self.collectionView registerClass:[ZQContentCell class] forCellWithReuseIdentifier:@"CONTENT"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UIEdgeInsets contentInset = self.collectionView.contentInset;
    contentInset.top = 20;
    [self.collectionView setContentInset:contentInset];
    
    [self.collectionView registerClass:[ZQContentCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER"];
    
    UICollectionViewLayout *layout = self.collectionView.collectionViewLayout;
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)layout;
    flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20);
    flow.headerReferenceSize = CGSizeMake(100, 25);
}

- (NSArray *)wordsInSection:(NSInteger)section{

    NSString *content = self.sections[section][@"content"];
    NSCharacterSet *space = [NSCharacterSet whitespaceAndNewlineCharacterSet];;
    NSArray *words = [content componentsSeparatedByCharactersInSet:space];
    return words;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return [self.sections count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    NSArray *words = [self wordsInSection:section];
    return [words count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *words = [self wordsInSection:indexPath.section];
    ZQContentCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CONTENT" forIndexPath:indexPath];
    cell.text = words[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    NSArray *words = [self wordsInSection:indexPath.section];
    CGSize size = [ZQContentCell sizeForContentString:words[indexPath.row]];
    return size;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind == UICollectionElementKindSectionHeader) {
        ZQHeaderCell *cell = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER" forIndexPath:indexPath];
        cell.text = self.sections[indexPath.section][@"header"];
        return cell;
    }
    return nil;
}
@end




























