//
//  RBRouteBuilder+Private.h
//  RouteBuilder
//
//  Created by AlexDenisov on 4/2/14.
//  Copyright (c) 2014 Railsware. All rights reserved.
//

#import "RBRouteBuilder.h"

@interface RBRouteBuilder ()

- (instancetype)root;

- (RBRouteBuilder *(^)(NSString *))add;
- (RBRouteBuilder *(^)(NSNumber *))rid;

- (NSString *)path;
- (NSURL *)URL;

@end
