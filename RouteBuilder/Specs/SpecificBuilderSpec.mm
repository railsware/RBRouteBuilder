#import "SpecificBuilder.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(SpecificBuilderSpec)

describe(@"SpecificBuilder", ^{
    __block SpecificBuilder *sut;
    NSString *rootPath = @"http://railsware.com";

    beforeEach(^{
        sut = [[SpecificBuilder alloc] initWithRootPath:rootPath];
    });

    afterEach(^{
        sut = nil;
    });

    describe(@"support custom components at", ^{
        NSNumber *resourceID = @(42);
        NSString *finalPath = [NSString stringWithFormat:@"%@/%@", rootPath, @"users"];
        NSString *finalPathWithResourceID = [NSString stringWithFormat:@"%@/%@/%@", rootPath, resourceID, @"users"];

        it(@"path", ^{
            sut.root.users.path should equal(finalPath);
            sut.root.rid(resourceID).users.path should equal(finalPath);
        });

        it(@"URL", ^{
            sut.root.users.URL should equal([NSURL URLWithString:finalPath]);
        });

    });

});

SPEC_END
