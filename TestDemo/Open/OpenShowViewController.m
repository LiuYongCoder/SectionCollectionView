//
//  OpenShowViewController.m
//  TestDemo
//
//  Created by DTiOS on 2021/1/26.
//

#import "OpenShowViewController.h"
#import "ServiceSectionCollectionViewCell.h"
#import "ServiceFooterCollectionReusableView.h"
#import "ServiceChildrenModel.h"

#define kItem_Number 2

@interface OpenShowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *openShowCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *openLayout;


@property (strong, nonatomic) ServiceFooterCollectionReusableView *footerView;
@property (strong, nonatomic) NSArray *serviceArr;
@property (strong, nonatomic) NSMutableArray *sectionAry;
@end

@implementation OpenShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _openShowCollectionView.delegate = self;
    _openShowCollectionView.dataSource = self;
    [_openShowCollectionView registerNib:[UINib nibWithNibName:@"ServiceSectionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ServiceSectionCollectionViewCell"];
    [_openShowCollectionView registerNib:[UINib nibWithNibName:@"ServiceFooterCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ServiceFooterCollectionReusableView"];
    _openLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 10) / 2, (SCREEN_WIDTH - 10) / 2);
    _openLayout.minimumInteritemSpacing = 10;
        
    [self getServiceData];
}

- (void)getServiceData
{
    NSArray *ary = [self getJsonObjectFromLocal:@"service.json"];
    self.serviceArr = [ServiceChildrenModel mj_objectArrayWithKeyValuesArray:ary];
    [self.openShowCollectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //如果能整除, 就返回正常结果
    if (self.serviceArr.count % kItem_Number == 0) {
        return self.serviceArr.count / kItem_Number;
    }
    //如果不能整除就在结果上加1
    return self.serviceArr.count / kItem_Number + 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //如果数组中有元素的时候走下面方法
    if (self.serviceArr.count > 0) {
        //找到最后一个分区
        if (section == self.serviceArr.count / kItem_Number) {
            //如果能被每行的个数整除
            if (self.serviceArr.count % kItem_Number == 0) {
                //返回每行的个数
                return kItem_Number;
            }
            //不然返回元素个数对每行个数的取余数
            return self.serviceArr.count % kItem_Number;
        }
        return kItem_Number;
    }
    return 0;
}

#pragma mark - 视图内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionFooter) {
        ServiceChildrenModel *model = [ServiceChildrenModel new];
        NSIndexPath *selectIndexPath = nil;
        for (NSIndexPath *selectPath in self.sectionAry) {
            if (selectPath.section == indexPath.section) {
                selectIndexPath = selectPath;
                model = self.serviceArr[selectPath.row + selectPath.section * kItem_Number];
            }
        }
        if (selectIndexPath == nil) {
            selectIndexPath = indexPath;
            model = self.serviceArr[indexPath.row + indexPath.section * kItem_Number];
        }
        ServiceFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ServiceFooterCollectionReusableView" forIndexPath:indexPath];
        footerView.childrenArr = model.children;
        footerView.sectionTitle = model.title;
        footerView.serviceFooterArrowsImageViewLayoutLeft.constant = selectIndexPath.row == 0 ? 25 : SCREEN_WIDTH - 25 - 20;
        return footerView;
    }
    return [UICollectionReusableView new];
}

//设置header的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 0);
}

//动态设置区尾的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    for (int i = 0; i < kItem_Number; i ++) {
        ServiceChildrenModel *rowOneModel = self.serviceArr[i + section * kItem_Number];
        if (rowOneModel.isSelect) {
            return CGSizeMake(SCREEN_WIDTH, rowOneModel.children.count * 45 + 15);
        }
    }
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    for (int i = 0; i < kItem_Number; i ++) {
        ServiceChildrenModel *rowOneModel = self.serviceArr[i + section * kItem_Number];
        if (rowOneModel.isSelect) {
            return UIEdgeInsetsMake(0, 0, 0, 0);
        }
    }
    return UIEdgeInsetsMake(0, 0, 10, 0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceSectionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceSectionCollectionViewCell" forIndexPath:indexPath];
    NSInteger rowIndex = indexPath.row + indexPath.section * kItem_Number;
    ServiceChildrenModel *model = self.serviceArr[rowIndex];
    cell.model = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 添加indexPath
    if ([self.sectionAry containsObject:indexPath]) {
        [self.sectionAry removeObject:indexPath];
    } else {
        for (NSIndexPath *selectIndexPath in self.sectionAry) {
            if (selectIndexPath.section == indexPath.section) {
                [self.sectionAry removeObject:selectIndexPath];
                break;
            }
        }
        [self.sectionAry addObject:indexPath];
    }

    // 处理同一行的一个展开一个关闭
    for (int i = 0; i < kItem_Number; i ++) {
        ServiceChildrenModel *model = self.serviceArr[i + indexPath.section * kItem_Number];
        if (indexPath.row == i) {
            model.isSelect = !model.isSelect;
        } else {
            model.isSelect = NO;
        }
    }

    [self.openShowCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    
    [self.openShowCollectionView reloadData];
}

- (NSArray *)serviceArr
{
    if (!_serviceArr) {
        _serviceArr = [NSArray array];
    }
    return _serviceArr;
}


- (NSMutableArray *)sectionAry
{
    if (!_sectionAry) {
        self.sectionAry = [NSMutableArray arrayWithCapacity:1];
    }
    return _sectionAry;
}
- (id)getJsonObjectFromLocal:(NSString *)jsonStr
{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:jsonStr ofType:nil];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSError *error;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    return jsonObject;
}

@end
