//
//  ServiceSectionCollectionViewCell.m
//  StandardApplication
//
//  Created by DTiOS on 2020/10/23.
//  Copyright © 2020 DTiOS. All rights reserved.
//

#import "ServiceSectionCollectionViewCell.h"

@implementation ServiceSectionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//服务首页
- (void)setModel:(ServiceChildrenModel *)model
{
    UIColor *imageViewColor = model.isSelect ? [UIColor redColor] : [UIColor blueColor];
    _serviceSectionImageView.backgroundColor = imageViewColor;
}


@end
