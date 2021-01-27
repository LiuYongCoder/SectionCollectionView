//
//  ServiceFooterCollectionReusableView.h
//  StandardApplication
//
//  Created by DTiOS on 2020/10/23.
//  Copyright © 2020 DTiOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroDefine.h"
#import "ServiceChildrenModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServiceFooterCollectionReusableView : UICollectionReusableView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *serviceFooterCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *serviceFooterLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *serviceFooterArrowsImageViewLayoutLeft;

@property (strong, nonatomic) NSArray *childrenArr;
@property (strong, nonatomic) NSString *sectionTitle;
@end

NS_ASSUME_NONNULL_END
