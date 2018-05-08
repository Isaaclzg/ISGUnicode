//
//  ISGUnicode.m
//  控制台输出中文
//  简书：https://www.jianshu.com/u/7e1b920cdac1
//
//  Created by Isaac on 2018/5/7.
//  Copyright © 2018年 Isaac. All rights reserved.
//

#import "ISGUnicode.h"
#import <objc/runtime.h>

static inline void ml_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation NSString (ISGUnicode)

- (NSString *)stringByReplaceUnicode {
    NSMutableString *convertedString = [self mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U"
                                     withString:@"\\u"
                                        options:0
                                          range:NSMakeRange(0, convertedString.length)];
    
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

@end

@implementation NSArray (ISGUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        ml_swizzleSelector(class, @selector(description), @selector(ml_description));
        ml_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(ml_descriptionWithLocale:));
        ml_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(ml_descriptionWithLocale:indent:));
    });
}

- (NSString *)ml_description {
    return [[self ml_description] stringByReplaceUnicode];
}

- (NSString *)ml_descriptionWithLocale:(nullable id)locale {
    return [[self ml_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)ml_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self ml_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSDictionary (ISGUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        ml_swizzleSelector(class, @selector(description), @selector(ml_description));
        ml_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(ml_descriptionWithLocale:));
        ml_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(ml_descriptionWithLocale:indent:));
    });
}

- (NSString *)ml_description {
    return [[self ml_description] stringByReplaceUnicode];
}

- (NSString *)ml_descriptionWithLocale:(nullable id)locale {
    return [[self ml_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)ml_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self ml_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSSet (ISGUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        ml_swizzleSelector(class, @selector(description), @selector(ml_description));
        ml_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(ml_descriptionWithLocale:));
        ml_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(ml_descriptionWithLocale:indent:));
    });
}

- (NSString *)ml_description {
    return [[self ml_description] stringByReplaceUnicode];
}

- (NSString *)ml_descriptionWithLocale:(nullable id)locale {
    return [[self ml_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)ml_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self ml_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end
