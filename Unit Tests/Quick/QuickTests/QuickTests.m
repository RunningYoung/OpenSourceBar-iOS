#import <Quick/Quick.h>

QuickSpecBegin(DolphinSpec)

describe(@"Test", ^{
    it(@"1", ^{
        XCTAssertEqual(1 + 1, 2, @"expected one plus one to equal two");
    });
});

QuickSpecEnd