#define EXP_SHORTHAND 1
#define MOCKITO_SHORTHAND 1
#define HC_SHORTHAND 1

#import "Specta.h"
#import "Expecta.h"
#import "UTSession.h"
#import "UTNetworkService.h"
#import "OCMockito.h"
#import "OCHamcrest.h"

SpecBegin(SpectaTests)

        describe(@"Session", ^{
            __block UTSession *session;
            __block id networkServiceMock;
            __block id sessionDelegateMock;

            beforeEach(^{
                networkServiceMock = mock([UTNetworkService class]);
                sessionDelegateMock = mockProtocol(@protocol(UTSessionDelegate));
                session = [[UTSession alloc] initWithNetworkService:networkServiceMock];
                [session setDelegate:sessionDelegateMock];
            });

            describe(@"start session", ^{
                __block void(^completionBlock)(NSError *, NSString *);

                beforeEach(^{
                    [session startSessionWithUsername:@"username" password:@"password"];

                    MKTArgumentCaptor *argumentCaptor = [[MKTArgumentCaptor alloc] init];
                    [verify(networkServiceMock) loginWithUsername:@"username" password:@"password" completion:[argumentCaptor capture]];
                    completionBlock = [argumentCaptor value];
                });

                it(@"should call login on network service", ^{
                    [verify(networkServiceMock) loginWithUsername:@"username" password:@"password" completion:anything()];
                });

                it(@"should return session running true", ^{
                    expect([session isRunning]).to.beTruthy;
                });

                context(@"when login success", ^{
                    beforeEach(^{
                        completionBlock(nil, @"token");
                    });

                    it(@"should set correct token", ^{
                        expect(session.token).to.equal(@"token");
                    });

                    it(@"should return logged in true", ^{
                        expect([session isLoggedIn]).to.beTruthy;
                    });

                    it(@"should call delegate login result", ^{
                        [verify(sessionDelegateMock) session:session loginResult:YES];
                    });
                });

                context(@"when login failure", ^{
                    beforeEach(^{
                        completionBlock([NSError errorWithDomain:@"doman" code:400 userInfo:@{}], nil);
                    });

                    it(@"should return logged in false", ^{
                        expect([session isLoggedIn]).to.beFalsy;
                    });

                    it(@"should call delegate login result", ^{
                        [verify(sessionDelegateMock) session:session loginResult:NO];
                    });
                });
            });

            describe(@"send data", ^{
                __block NSError *receivedError;
                __block NSString *receivedData;

                context(@"when is logged in", ^{

                    beforeEach(^{
                        session.token = @"token";

                        [session sendData:@"data" completion:^(NSError *error, NSString *data) {
                            receivedError = error;
                            receivedData = data;
                        }];
                    });

                    it(@"should call send data on network service", ^{
                        [verify(networkServiceMock) sendData:@"data" token:@"token" completion:anything()];
                    });

                    context(@"when data sent", ^{
                        beforeEach(^{
                            MKTArgumentCaptor *argumentCaptor = [[MKTArgumentCaptor alloc]  init];
                            [verify(networkServiceMock) sendData:@"data" token:@"token" completion:[argumentCaptor capture]];
                            void(^completionBlock)(NSError *, NSString *) = [argumentCaptor value];
                            completionBlock(nil, @"data");
                        });

                        it(@"should call completion block with result", ^{
                            expect(receivedError).to.beNil;
                            expect(receivedData).to.equal(@"data");
                        });
                    });
                });

                context(@"when is not logged in", ^{
                    beforeEach(^{
                        session.token = nil;

                        [session sendData:@"data" completion:^(NSError *error, NSString *data) {
                            receivedError = error;
                            receivedData = data;
                        }];
                    });

                    it(@"should call completion block with error", ^{
                        expect(receivedError).notTo.beNil;
                        expect(receivedData).to.beNil;
                    });
                });
            });

            describe(@"stop session", ^{
                beforeEach(^{
                    session.token = @"token";

                    [session stopSession];
                });

                it(@"should return session running false", ^{
                    expect([session isRunning]).to.beFalsy;
                });

                it(@"should call logout on network service", ^{
                    [verify(networkServiceMock) logout:@"token"];
                });

                it(@"should set token to nil", ^{
                    expect(session.token).to.beNil;
                });
            });

            pending(@"when something is not finished yet", ^{
                //temporarily disabling
            });

            xdescribe(@"when something is not finished yet", ^{
                //another example of temporarily disabling
            });

            sharedExamples(@"shared examples", ^(NSDictionary *data) {
                NSNumber *sharedObject = data[@"shareObject"];
                //shared it
            });

            itBehavesLike(@"shared behaviour", ^NSDictionary * {
                return @{@"sharedObject": @3};
            });
        });

SpecEnd