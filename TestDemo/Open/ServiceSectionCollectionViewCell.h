//
//  ServiceSectionCollectionViewCell.h
//  StandardApplication
//
//  Created by DTiOS on 2020/10/23.
//  Copyright © 2020 DTiOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroDefine.h"
#import "ServiceChildrenModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServiceSectionCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *serviceSectionImageView;
@property (strong, nonatomic) ServiceChildrenModel *model;

@end

NS_ASSUME_NONNULL_END
