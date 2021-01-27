//
//  ServiceFooterCollectionReusableView.m
//  StandardApplication
//
//  Created by DTiOS on 2020/10/23.
//  Copyright © 2020 DTiOS. All rights reserved.
//

#import "ServiceFooterCollectionReusableView.h"
#import "MacroDefine.h"
#import "ServiceFooterCollectionViewCell.h"

@implementation ServiceFooterCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
        
    _serviceFooterCollectionView.delegate = self;
    _serviceFooterCollectionView.dataSource = self;
    [_serviceFooterCollectionView registerNib:[UINib nibWithNibName:@"ServiceFooterCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ServiceFooterCollectionViewCell"];
    _serviceFooterLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 45);
    _serviceFooterLayout.minimumLineSpacing = 0;
    _serviceFooterLayout.minimumInteritemSpacing = 0;
}

- (void)setChildrenArr:(NSArray *)childrenArr
{
    _childrenArr = childrenArr;
    [self.serviceFooterCollectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _childrenArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceFooterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceFooterCollectionViewCell" forIndexPath:indexPath];
    ServiceTwoChildrenModel *model = _childrenArr[indexPath.row];
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    }
    cell.serviceFooterView.backgroundColor = [UIColor colorWithHexString:NONullString(model.iconColor)];
    return cell;
}


@end
