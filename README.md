RBRouteBuilder
=================

RBRouteBuilder provides a mechanism to make routes for requests without headache with strings.

So instead of
```objectivec
NSString *path = [NSString stringWithFormat:@"users/%@/projects", userID];
```
might be used
```
NSString *path = router().users.withID(userID).projects.path;
```

[More real example](https://github.com/railsware/RBRouteBuilder/blob/master/README.md#example)

### Installation

```
pod 'RBRouteBuilder'
```

*Note:* RBRouteBuilder has a quite strange integration mechanism, so it provides a file template to simplify this process.
It can be installed by calling `install_templates.sh` script from the repository root
```bash
git clone https://github.com/railsware/RBRouteBuilder.git
cd RBRouteBuilder
sh install_templates.sh
```

### Usage

There are few things need to be done to start using RBRouteBuilder.

#### Routes definition

First of all, protocol with route definitions should be added, also this protocol can have one of the following methods: 

`- (instancetype)root;` - returns builder instance with the root path 

`- (NSString *)path;` - generates NSString from all called methods

`- (NSString *)URL` - generates NSURL from all called methods

Probable protocol definition

```objectivec
@protocol Router

- (instancetype)root;
- (NSString *)path;
- (NSURL *)URL;

- (instancetype)users;
- (instancetype)projects;

@end
```

**Note:** do not worry about implementation, all this stuff will be done by RBRouteBuilder internals

#### Builder instantiation

Builder should be instantiated by calling method `rb_route_builder` with the root path as a parameter. This method defined at `RouterBulider.h`, so do not forget to import it.

Here is a sample of how it could be done

```objectivec
static inline id<Router> routeBuilder()
{
    return rb_route_builder(@"http://api.sample.com");
}
```

Static method `routeBuilder` can have any possible name, but it's return type must conform to the newly created protocol.
This rule affords using of chained calls:

```objectivec
routeBuilder().users.path;
routeBuilder().root.projects.URL;
```

#### Builder helpers

`RBRouteBuilder` has two helper methods, which might be very useful:

`add(NSString *)` - adds string to the bulider

`withID(NSNumber *)` - adds numeric identifier to the bulider

This methods also might be defined in the protocol if necessary. They use blocks under the hood and have the same rule as method `routeBuilder` from previous section: to allow method chaining the return type must conform to protocol:

```
- (id<Router> (^)(NSString *))add;
- (id<Router> (^)(NSNumber *))withID;
```

#### Xcode Template

Xcode template provided by `RBRouteBuilder` can be used to avoid all these routines.

![RBRouteBuilder Xcode template](https://github.com/raislware/RBRouteBuilder/blob/master/Templates/template.png?raw=true).

#### Example

Here is how it might look for dealing with GitHub API routes

```objectivec
// GHRouter.h
#import <RBRouteBuilder/RouteBuilder.h>

@protocol GHRouter
    <NSObject>

@optional

- (instancetype)root;
- (NSString *)path;
- (NSURL *)URL;

- (id<GHRouter>(^)(NSString *))add;
- (id<GHRouter>(^)(NSNumbre *))withID;

// User-defined routes

- (instancetype)users;
- (instancetype)orgs;

@end

static id<GHRouter> router()
{
    return rb_route_builder(@"https://api.github.com");
}

// ...
// ...
// ...

NSURL *orgsURL = router().users.add(@"AlexDenisov").orgs.URL;
// NSURL: /users/AlexDenisov/orgs
NSString *fullOrgPath = router().root.orgs.add(@"Railsware").path;
// NSString: https://api.github.com/orgs/Railsware
```

### License

This project distributed under the MIT license.

See `LICENSE` for more details.
