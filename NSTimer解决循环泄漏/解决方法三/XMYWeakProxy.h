//
//  XMYWeakProxy.h
//  NSTimer解决循环泄漏
//
//  Created by 许明洋 on 2020/9/17.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMYWeakProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
