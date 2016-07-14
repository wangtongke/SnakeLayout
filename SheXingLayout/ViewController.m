//
//  ViewController.m
//  SheXingLayout
//
//  Created by 王同科 on 16/7/11.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "ViewController.h"
#import "WTKSnakeLayout.h"
#import "WTKCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation ViewController

/****
 *只需要使用layout给CollectionView布局，layout的block为创建线。
 ***/
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configView];
    
}

- (void)configView
{

    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%f",self.view.frame.size.height);
    WTKSnakeLayout *layout = [[WTKSnakeLayout alloc]init];
    __weak __typeof (&*self)weakSelf = self;
    layout.block = ^(NSInteger tag,CGRect rect){
        [weakSelf createLineWithTag:tag withRect:rect];
        
    };
    layout.columnCount = 5;
    layout.columnMargin = 40;
    layout.wSectionInset = UIEdgeInsetsMake(40, 30, 40, 30);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WTKCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
}

- (void)createLineWithTag:(NSInteger )tag withRect:(CGRect)rect
{
    UIView *line = [[UIView alloc]initWithFrame:rect];
    line.backgroundColor = [UIColor blackColor];
    [self.collectionView addSubview:line];
}

#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 40;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WTKCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    cell.label.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
