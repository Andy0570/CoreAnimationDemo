//
//  HQLTableViewCellStyleDefaultModel.m
//  HQLTakePhotoDemo
//
//  Created by Qilin Hu on 2018/4/2.
//  Copyright © 2018年 ToninTech. All rights reserved.
//

#import "HQLTableViewCellStyleDefaultModel.h"
#import <YYKit/NSObject+YYModel.h>

@implementation HQLTableViewCellStyleDefaultModel

#pragma mark - NSObject

- (NSString *)description {
    return [self modelDescription];
}

#pragma mark - HQLTableViewCellKeyValueConfigureDelegate

- (NSString *)titleLabelText {
    return _title;
}

- (NSString *)detailLabelText {
    return _detail;
}

@end
