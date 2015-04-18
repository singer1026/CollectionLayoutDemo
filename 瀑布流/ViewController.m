//
//  ViewController.m
//  瀑布流
//
//  Created by Singer on 15/4/12.
//  Copyright (c) 2015年 Singer. All rights

#import "ViewController.h"
#import "MJExtension.h"
#import "Shop.h"
#import "ShopCell.h"
#import "UIImageView+WebCache.h"
#import "RACollectionViewTripletLayout.h"


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,RACollectionViewDelegateTripletLayout>
@property (weak, nonatomic)IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *shops;
@end

@implementation ViewController

static NSString *const shopCellID = @"shopCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.shops = [NSMutableArray array];
    NSArray *array = [Shop objectArrayWithFilename:@"1.plist"];
    [self.shops addObjectsFromArray:array];

    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;

    RACollectionViewTripletLayout *flowLayout = [[RACollectionViewTripletLayout alloc]init];
    flowLayout.delegate = self;
    _collectionView.collectionViewLayout = flowLayout;

    [self.collectionView registerNib:[UINib nibWithNibName:@"ShopCell" bundle:nil] forCellWithReuseIdentifier:shopCellID];
   
    [self.view addSubview:_collectionView];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _shops.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopCell *shopCell = [collectionView dequeueReusableCellWithReuseIdentifier:shopCellID forIndexPath:indexPath];
    Shop *shop = _shops[indexPath.item];
    [shopCell.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img]];
    shopCell.priceLabel.text = [NSString stringWithFormat:@"%ld",indexPath.item+1];
    shopCell.backgroundColor = [UIColor grayColor];
    return shopCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click %ld",indexPath.item);
}

- (UIEdgeInsets)insetsForCollectionView:(UICollectionView *)collectionView{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)minimumInteritemSpacingForCollectionView:(UICollectionView *)collectionView{
    return 10.0f;
}
- (CGFloat)minimumLineSpacingForCollectionView:(UICollectionView *)collectionView{
    return 10.0f;
}

@end
