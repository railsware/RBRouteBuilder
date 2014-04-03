#import "SpecificRoutes.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(SpecificBuilderSpec)

describe(@"SpecificBuilder", ^{
    NSString *rootPath = @"http://railsware.com";

    describe(@"support custom components at", ^{
        NSNumber *resourceID = @(42);
        NSString *finalPath = [NSString stringWithFormat:@"%@/%@", rootPath, @"users"];
        NSString *finalPathWithResourceID = [NSString stringWithFormat:@"%@/%@/%@", rootPath, resourceID, @"users"];

        it(@"path", ^{
            router().root.users.path should equal(finalPath);
            router().root.withID(resourceID).users.path should equal(finalPathWithResourceID);
        });

        it(@"URL", ^{
            router().root.users.URL should equal([NSURL URLWithString:finalPath]);
            router().root.withID(resourceID).users.URL should equal([NSURL URLWithString:finalPathWithResourceID]);
        });

    });

});

SPEC_END
