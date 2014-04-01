//
// Created by AlexDenisov on 4/1/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

#import "RBRouteBuilderProtocol.h"

@interface RBRouteBuilder : NSObject
    <RBRouteBuilderProtocol>

- (instancetype)initWithRootPath:(NSString *)rootPath;

@end