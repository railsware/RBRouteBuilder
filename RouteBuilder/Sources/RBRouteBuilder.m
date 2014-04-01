//
// Created by AlexDenisov on 4/1/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#import "RBRouteBuilder.h"

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

@end