#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

QuickSpecBegin(QuickTests)

describe(@"Test", ^{
    it(@"1", ^{
        expect(@(@"test".length)).to(equal(@5));
    });
});

QuickSpecEnd