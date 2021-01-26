//
//  BasicsShowViewController.m
//  TestDemo
//
//  Created by DTiOS on 2021/1/26.
//

#import "BasicsShowViewController.h"
#import "MacroDefine.h"
#import "BasicsHeaderCollectionReusableView.h"
#import "BasicsShowCollectionViewCell.h"

@interface BasicsShowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *basicsCollectioView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *basicsLayout;

@end

@implementation BasicsShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _basicsCollectioView.delegate = self;
    _basicsCollectioView.dataSource = self;
    [_basicsCollectioView registerNib:[UINib nibWithNibName:@"BasicsShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BasicsShowCollectionViewCell"];
    [_basicsCollectioView registerNib:[UINib nibWithNibName:@"BasicsHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"BasicsHeaderCollectionReusableView"];
    CGFloat width = (SCREEN_WIDTH - 16 * 2 - 9) / 2;
    CGFloat height = SCREEN_WIDTH > 375.0 ? 95 : 82;
    _basicsLayout.itemSize = CGSizeMake(width, height);
    _basicsLayout.minimumLineSpacing = 9;
    _basicsLayout.minimumInteritemSpacing = 9;
    _basicsLayout.sectionInset = UIEdgeInsetsMake(10, 16, 14, 16);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 8;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return section % 2 == 0 ? 2 : 3;
}

#pragma mark - 视图内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    

    if (kind == UICollectionElementKindSectionHeader) {
        // 头部试图
        BasicsHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"BasicsHeaderCollectionReusableView" forIndexPath:indexPath];
        return headerView;
    }
    return [UICollectionReusableView new];
}

//设置header的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section % 2 == 0) {
        return CGSizeMake(SCREEN_WIDTH, 0);
    }
    return CGSizeMake(SCREEN_WIDTH, 50);
}

//设置footer的高度

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BasicsShowCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BasicsShowCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

@end
