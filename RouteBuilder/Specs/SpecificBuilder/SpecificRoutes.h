//
// Created by AlexDenisov on 4/1/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

@protocol SpecificRoutes;

typedef id<SpecificRoutes> (^RouteWithName)(NSString *name);
typedef id<SpecificRoutes> (^RouteWithID)(NSNumber *resourceID);

@protocol SpecificRoutes
    <NSObject>

@optional

// Do not modify these definitions

- (instancetype)root;
- (NSString *)path;
- (NSURL *)URL;

- (RouteWithName)add;
- (RouteWithID)withID;

// User-defined routes

- (instancetype)users;

@end
