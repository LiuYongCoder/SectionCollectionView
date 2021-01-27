//
//  ServiceChildrenModel.h
//  TestDemo
//
//  Created by DTiOS on 2021/1/27.
//

#import <Foundation/Foundation.h>
#import "MacroDefine.h"
NS_ASSUME_NONNULL_BEGIN

@interface ServiceSelectedImageModel : NSObject
@property (retain, nonatomic) NSString *contentType;
@end

@interface ServiceTwoChildrenModel : NSObject
@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) NSString *iconColor;
@end

@interface ServiceChildrenModel : NSObject

@property (retain, nonatomic) NSString *title;//标题
@property (strong, nonatomic) ServiceSelectedImageModel *selectedImage;
@property (strong, nonatomic) ServiceSelectedImageModel *unSelectedImage;
@property (strong, nonatomic) NSArray *children;
@property (retain, nonatomic) NSString *iconColor;

// 判断是否被选择
@property (assign, nonatomic) BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
