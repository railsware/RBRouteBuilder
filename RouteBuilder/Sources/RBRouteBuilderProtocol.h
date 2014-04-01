//
// Created by AlexDenisov on 4/1/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#import "RBPublicDefinitions.h"

@class RBRouteBuilder;

@protocol RBRouteBuilderProtocol
    <NSObject>

- (NSString *)path;
- (NSURL *)URL;

- (instancetype)root;

- (instancetype(^)(NSString *))add;
- (id<RBRouteBuilderProtocol>(^)(NSNumber *))rid;

@end
