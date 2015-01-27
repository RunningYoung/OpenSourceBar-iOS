#define EXP_SHORTHAND 1

#import "Specta.h"
#import "Expecta.h"

SpecBegin(SpectaTests)

        describe(@"Sample tests", ^{
            it(@"Test 1", ^{
                expect(@"foo").to.equal("foo1");
            });
        });

SpecEnd