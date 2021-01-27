//
//  ServiceChildrenModel.m
//  TestDemo
//
//  Created by DTiOS on 2021/1/27.
//

#import "ServiceChildrenModel.h"

@implementation ServiceSelectedImageModel

@end

@implementation ServiceTwoChildrenModel

@end

@implementation ServiceChildrenModel

- (NSArray *)children
{
    if (_children.count > 0) {
        _children = [ServiceTwoChildrenModel mj_objectArrayWithKeyValuesArray:_children];
    }
    return _children;
}

@end
