//
//  XMYProxy.h
//  NSTimer解决循环泄漏
//
//  Created by 许明洋 on 2020/9/17.
//  Copyright © 2020 许明洋. All rights reserved.
//
/*
 尝试加入一个中间代理对象，来解决NSTimer的问题
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMYProxy : NSObject

+ (instancetype)proxyWithTarget:(id)target;
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
