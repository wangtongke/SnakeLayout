//
//  SnakeLayout.m
//  SheXingLayout
//
//  Created by 王同科 on 16/7/11.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "WTKSnakeLayout.h"

@interface WTKSnakeLayout ()

@property(nonatomic,assign)CGFloat currentHeight;

@property(nonatomic,strong)NSMutableArray *attributeArray;

@end

@implementation WTKSnakeLayout

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initData];
    }
    return self;
}
/**
 *初始化默认数据
 */
- (void)initData
{
    self.wSectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.columnCount = 6;
    self.rowMargin = 70;
    self.columnMargin = 20;
    self.lineWidth = 1;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self.attributeArray removeAllObjects];
    
    // 默认只有一个区
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i ++)
    {
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];

        
//        宽高位置
        CGFloat width = (self.collectionView.frame.size.width - self.wSectionInset.left - self.wSectionInset.right - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
        CGFloat height = width;
        
        NSInteger row = i / self.columnCount;//1
        NSInteger list = i % self.columnCount;
        
        if ( row % 2 == 1)
        {
            list = (self.columnCount * (row * 2 + 1) - 1 - i) % self.columnCount;
        }
        
        CGFloat x = self.wSectionInset.left + (self.columnMargin + width) * list;
        CGFloat y = self.wSectionInset.top + (self.rowMargin + height) * row;
        
        attribute.frame = CGRectMake(x, y, width, height);

        [self.attributeArray addObject:attribute];
        
//        使用block 传递事件 创建线
        if(self.block)
        {
            CGRect rect;
            if ((i + 1) % self.columnCount == 0)
            {
//                转弯
                rect.size.height = self.rowMargin;
                rect.size.width = 1;
                rect.origin.x = x + ( width - self.lineWidth) / 2.0 ;
                rect.origin.y = (y + height);

            }
            else
            {
                if (row % 2 == 0)
                {
//                    ->
                    rect.size.height = 1;
                    rect.size.width = self.columnMargin;
                    rect.origin.x = x + width;
                    rect.origin.y = y + ( height - self.lineWidth) / 2.0;
                }
                else
                {
//                    <-
                    rect.size.height = 1;
                    rect.size.width = self.columnMargin;
                    rect.origin.x = (x - self.columnMargin) ;
                    rect.origin.y =  y + (height - self.lineWidth) / 2.0;
                }
            }
            if (i < count -1)
            {
                self.block(i,rect);
            }
            
        }
        
        
        
    }
}

- (CGSize)collectionViewContentSize
{
    UICollectionViewLayoutAttributes *attribute = [self.attributeArray lastObject];
    CGFloat y = attribute.frame.origin.y + attribute.size.height + self.wSectionInset.bottom;
    return CGSizeMake(self.collectionView.frame.size.width, y);
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributeArray;
}

- (NSMutableArray *)attributeArray
{
    if (!_attributeArray)
    {
        _attributeArray = [[NSMutableArray alloc]init];
    }
    return _attributeArray;
}

@end
