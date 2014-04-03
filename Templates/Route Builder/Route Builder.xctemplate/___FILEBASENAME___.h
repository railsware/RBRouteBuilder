//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <RBRouteBuilder/RouteBuilder.h>

@protocol ___FILEBASENAMEASIDENTIFIER___;

typedef id<___FILEBASENAMEASIDENTIFIER___> (^RouteWithName)(NSString *name);
typedef id<___FILEBASENAMEASIDENTIFIER___> (^RouteWithID)(NSNumber *resourceID);

@protocol ___FILEBASENAMEASIDENTIFIER___
    <NSObject>

@optional

// Do not modify these definitions

- (instancetype)root;
- (NSString *)path;
- (NSURL *)URL;

- (RouteWithName)add;
- (RouteWithID)withID;

// User-defined routes

/* 
- (instancetype)users;
- (instancetype)projects;
*/
@end

static id<___FILEBASENAMEASIDENTIFIER___> routeBuilder()
{
    return rb_route_builder(@"http://sample.com");
}

