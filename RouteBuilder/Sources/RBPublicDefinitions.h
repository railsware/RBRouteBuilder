//
// Created by AlexDenisov on 4/1/14.
// Copyright (c) 2014 Railsware. All rights reserved.
//

@protocol RBRouteBuilderProtocol;

typedef id<RBRouteBuilderProtocol> (^BuildWithName)(NSString *routeName);
typedef id<RBRouteBuilderProtocol> (^BuildWithResourceID)(NSNumber *resourceID);
