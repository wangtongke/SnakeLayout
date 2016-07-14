//
//  SnakeLayout.h
//  SheXingLayout
//
//  Created by 王同科 on 16/7/11.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface WTKSnakeLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)UIEdgeInsets wSectionInset;

/**
 *行间距
 */
@property(nonatomic,assign)CGFloat rowMargin;

/**
 *列间距
 */
@property(nonatomic,assign)CGFloat columnMargin;

/**
 *列数
 */
@property(nonatomic,assign) int columnCount;

/**
 *线条宽度
 */
@property(nonatomic,assign)CGFloat lineWidth;

/**
 *创建线  在ViewController 或者 collectionView 调用这个Block 创建线
 */
@property(nonatomic,copy)void (^block)(NSInteger,CGRect);



@end
