#import "RBRouteBuilder.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RBRouteBuilderSpec)

describe(@"RBRouteBuilder", ^{
    __block RBRouteBuilder *sut;
    NSString *rootPath = @"http://railsware.com";

    beforeEach(^{
        sut = [[RBRouteBuilder alloc] initWithRootPath:rootPath];
    });
    afterEach(^{
        sut = nil;
    });

    describe(@"have root", ^{

        it(@"path", ^{
            sut.root.path should equal(rootPath);
        });

        it(@"URL", ^{
            sut.root.URL should equal([NSURL URLWithString:rootPath]);
        });

    });

    describe(@"should concatenate", ^{
        NSString *appendix = @"hello";
        NSString *fullPath = [NSString stringWithFormat:@"%@/%@", rootPath, appendix];

        it(@"path", ^{
            sut.and(appendix).path should equal(fullPath);
        });

        it(@"URL", ^{
            sut.and(appendix).URL should equal([NSURL URLWithString:fullPath]);
        });

    });
});

SPEC_END
