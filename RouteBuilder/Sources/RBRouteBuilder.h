//
// Created by AlexDenisov on 4/1/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

@interface RBRouteBuilder : NSObject

- (instancetype)initWithRootPath:(NSString *)rootPath;
- (instancetype)root;

- (RBRouteBuilder *(^)(NSString *))add;
- (RBRouteBuilder *(^)(NSNumber *))withID;

- (NSString *)path;
- (NSURL *)URL;

@end
