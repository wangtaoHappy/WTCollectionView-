//
//  ViewController.m
//  WTCollectionView流水布局
//
//  Created by 王涛 on 2017/3/31.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "ViewController.h"

#import "WTCollectionViewLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[WTCollectionViewLayout alloc] init]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 120;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row%3 == 0) {
        cell.backgroundColor = [UIColor cyanColor];
    }else if (indexPath.row%3 == 1){
        cell.backgroundColor = [UIColor redColor];
    }else {
         cell.backgroundColor = [UIColor yellowColor];
    }
    
    return cell;
}

@end
