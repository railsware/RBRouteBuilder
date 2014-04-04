//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <RBRouteBuilder/RouteBuilder.h>

@protocol ___FILEBASENAMEASIDENTIFIER___
    <NSObject>

@optional

- (instancetype)root;
- (NSString *)path;
- (NSURL *)URL;

- (id<___FILEBASENAMEASIDENTIFIER___>(^)(NSString *))add;
- (id<___FILEBASENAMEASIDENTIFIER___>(^)(NSNumber *))withID;

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

