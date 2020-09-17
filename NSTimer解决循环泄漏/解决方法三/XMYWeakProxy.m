//
//  XMYWeakProxy.m
//  NSTimer解决循环泄漏
//
//  Created by 许明洋 on 2020/9/17.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "XMYWeakProxy.h"

@implementation XMYWeakProxy

+ (instancetype)proxyWithTarget:(id)target {
    XMYWeakProxy *proxy = [XMYWeakProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

- (void)dealloc {
    NSLog(@"XMYWeakProxy执行了dealloc方法");
}

@end
