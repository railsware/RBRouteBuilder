//
// Created by AlexDenisov on 4/1/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#import <objc/runtime.h>
#import "RBRouteBuilder.h"

static id<RBRouteBuilderProtocol> dynamicRouteResolver(id<RBRouteBuilderProtocol> self, SEL _cmd)
{
    NSString *component = NSStringFromSelector(_cmd);
    self.add(component);
    return self;
}

@implementation RBRouteBuilder
{
    NSMutableString *_backingPath;
    NSString *_rootPath;
}

- (instancetype)initWithRootPath:(NSString *)rootPath
{
    self = [super init];
    if (self) {
        _rootPath = [rootPath copy];
        _backingPath = [NSMutableString new];
    }

    return self;
}

- (NSString *)path
{
    return [NSString stringWithString:_backingPath];
}

- (NSURL *)URL
{
    return [NSURL URLWithString:self.path];
}

- (instancetype)root
{
    _backingPath = [NSMutableString stringWithString:_rootPath];
    return self;
}

- (BuildWithName)add
{
    return ^id <RBRouteBuilderProtocol>(NSString *routeName) {
        [_backingPath appendFormat:@"/%@", routeName];
        return self;
    };
}

- (BuildWithResourceID)rid
{
    return ^id <RBRouteBuilderProtocol>(NSNumber *resourceID) {
        [_backingPath appendFormat:@"/%@", resourceID];
        return self;
    };
}

#pragma mark - Dynamic method resolution

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    BOOL canResolve = class_addMethod([self class], sel, (IMP)dynamicRouteResolver, "@@:");
    return canResolve;
}

@end
