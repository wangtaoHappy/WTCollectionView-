//
//  WTCollectionViewLayout.m
//  WTCollectionView流水布局
//
//  Created by 王涛 on 2017/3/31.
//  Copyright © 2017年 王涛. All rights reserved.
//


#import "WTCollectionViewLayout.h"


@interface WTCollectionViewLayout ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation WTCollectionViewLayout

-(NSMutableArray *)array {

    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (void)prepareLayout {

    [super prepareLayout];
    [self.array removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        // 创建UICollectionViewLayoutAttributes
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        // 设置布局属性
        CGFloat width = self.collectionView.frame.size.width * 0.5;
        if (i == 0) {
            CGFloat height = width;
            CGFloat x = 0;
            CGFloat y = 0;
            attrs.frame = CGRectMake(x, y, width, height);
        } else if (i == 1) {
            CGFloat height = width * 0.5;
            CGFloat x = width;
            CGFloat y = 0;
            attrs.frame = CGRectMake(x, y, width, height);
        } else if (i == 2) {
            CGFloat height = width * 0.5;
            CGFloat x = width;
            CGFloat y = height;
            attrs.frame = CGRectMake(x, y, width, height);
        } else if (i == 3) {
            CGFloat height = width * 0.5;
            CGFloat x = 0;
            CGFloat y = width;
            attrs.frame = CGRectMake(x, y, width, height);
        } else if (i == 4) {
            CGFloat height = width * 0.5;
            CGFloat x = 0;
            CGFloat y = width + height;
            attrs.frame = CGRectMake(x, y, width, height);
        } else if (i == 5) {
            CGFloat height = width;
            CGFloat x = width;
            CGFloat y = width;
            attrs.frame = CGRectMake(x, y, width, height);
        } else {
            UICollectionViewLayoutAttributes *lastAttrs = self.array[i - 6];
            CGRect lastFrame = lastAttrs.frame;
            lastFrame.origin.y += 2 * width;
            attrs.frame = lastFrame;
        }
        // 添加UICollectionViewLayoutAttributes
        [self.array addObject:attrs];
    }
}

- (CGSize)collectionViewContentSize {
    int count = (int)[self.collectionView numberOfItemsInSection:0];
    int rows = (count + 3 - 1) / 3;
    CGFloat rowH = self.collectionView.frame.size.width * 0.5;
    return CGSizeMake(0, rows * rowH);

}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.array;
}
@end
