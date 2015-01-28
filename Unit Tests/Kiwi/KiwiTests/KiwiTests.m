#import "Kiwi.h"
#import "UTSession.h"
#import "UTNetworkService.h"

SPEC_BEGIN(KiwiTests)

    describe(@"Session", ^{
        __block UTSession *session;
        __block id networkServiceMock;
        __block id sessionDelegateMock;

        beforeEach(^{
            networkServiceMock = [UTNetworkService nullMock];
            sessionDelegateMock = [KWMock nullMockForProtocol:@protocol(UTSessionDelegate)];
            session = [[UTSession alloc] initWithNetworkService:networkServiceMock];
            [session setDelegate:sessionDelegateMock];
        });

        context(@"start session", ^{
            it(@"should call login on network service", ^{
                [[networkServiceMock should] receive:@selector(loginWithUsername:password:completion:) withArguments:@"username", @"password", [KWAny any]];

                [session startSessionWithUsername:@"username" password:@"password"];
            });

            it(@"should return session running true", ^{
                [session startSessionWithUsername:@"username" password:@"password"];

                [[theValue([session isRunning]) should] beTrue];
            });

            context(@"login success", ^{
                __block void(^completionBlock)(NSError *, NSString *);

                beforeEach(^{
                    KWCaptureSpy *completionSpy = [networkServiceMock captureArgument:@selector(loginWithUsername:password:completion:) atIndex:2];
                    [session startSessionWithUsername:@"username" password:@"password"];
                    completionBlock = completionSpy.argument;
                });

                it(@"should set correct token", ^{
                    completionBlock(nil, @"token");

                    [[session.token should] equal:@"token"];
                });

                it(@"should return logged in true", ^{
                    completionBlock(nil, @"token");

                    [[theValue([session isLoggedIn]) should] beTrue];
                });

                it(@"should call delegate login result", ^{
                    [[sessionDelegateMock should] receive:@selector(session:loginResult:) withArguments:session, theValue(YES)];

                    completionBlock(nil, @"token");
                });
            });

            context(@"login failure", ^{
                __block void(^completionBlock)(NSError *, NSString *);

                beforeEach(^{
                    KWCaptureSpy *completionSpy = [networkServiceMock captureArgument:@selector(loginWithUsername:password:completion:) atIndex:2];
                    [session startSessionWithUsername:@"username" password:@"password"];
                    completionBlock = completionSpy.argument;
                });

                it(@"should return logged in false", ^{
                    completionBlock([NSError errorWithDomain:@"doman" code:400 userInfo:@{}], nil);

                    [[theValue([session isLoggedIn]) should] beFalse];
                });

                it(@"should call delegate login result", ^{
                    [[sessionDelegateMock should] receive:@selector(session:loginResult:) withArguments:session, theValue(NO)];

                    completionBlock([NSError errorWithDomain:@"doman" code:400 userInfo:@{}], nil);
                });
            });
        });

        context(@"send data", ^{
            __block NSError *receivedError;
            __block NSString *receivedData;

            context(@"is logged in", ^{
                beforeEach(^{
                    session.token = @"token";
                });

                it(@"should call send data on network service", ^{
                    [[networkServiceMock should] receive:@selector(sendData:token:completion:) withArguments:@"data", @"token", [KWAny any]];

                    [session sendData:@"data" completion:^(NSError *error, NSString *string) {}];
                });

                context(@"data sent", ^{
                    __block void(^completionBlock)(NSError *, NSString *);

                    beforeEach(^{
                        KWCaptureSpy *completionSpy = [networkServiceMock captureArgument:@selector(sendData:token:completion:) atIndex:2];
                        [session sendData:@"data" completion:^(NSError *error, NSString *data) {
                            receivedError = error;
                            receivedData = data;
                        }];
                        completionBlock = completionSpy.argument;
                    });

                    it(@"should call completion block with result", ^{
                        completionBlock(nil, @"data");

                        [[receivedError should] beNil];
                        [[receivedData should] equal:@"data"];
                    });
                });
            });

            context(@"is not logged in", ^{
                beforeEach(^{
                    session.token = nil;

                    [session sendData:@"data" completion:^(NSError *error, NSString *data) {
                        receivedError = error;
                        receivedData = data;
                    }];
                });

                it(@"should call completion block with error", ^{
                    [[receivedError should] beNonNil];
                    [[receivedData should] beNil];
                });
            });
        });

        context(@"stop session", ^{
            beforeEach(^{
                session.token = @"token";
            });

            it(@"should return session running false", ^{
                [session stopSession];

                [[theValue([session isRunning]) should] beFalse];
            });

            it(@"should call logout on network service", ^{
                [[networkServiceMock should] receive:@selector(logout:) withArguments:@"token"];

                [session stopSession];
            });

            it(@"should set token to nil", ^{
                [session stopSession];

                [[session.token should] beNil];
            });
        });
    });

SPEC_END