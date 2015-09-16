//
//  Digits.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

#import "DGTAppearance.h"
#import "DGTAuthenticateButton.h"
#import "DGTContactAccessAuthorizationStatus.h"
#import "DGTSession.h"
#import <TwitterCore/TWTRAuthConfig.h>

@class UIViewController;
@class TWTRAuthConfig;
@protocol DGTSessionUpdateDelegate;
@protocol DGTCompletionViewController;

/**
 *  The `Digits` class contains the main methods to implement the Digits authentication flow.
 */
@interface Digits : NSObject

/**
 *  Returns the unique Digits object (singleton).
 *
 *  @return The Digits singleton.
 */
+ (Digits *)sharedInstance;

/**
 *  Start Digits with your consumer key and secret. These will override any credentials
 *  present in your applications Info.plist.
 *
 *  You do not need to call this method unless you wish to provide credentials other than those
 *  in your Info.plist.
 *
 *  @param consumerKey    Your Digits application's consumer key.
 *  @param consumerSecret Your Digits application's consumer secret.
 */
- (void)startWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret;

/**
 *  Start Digits with a consumer key, secret, and keychain access group. See -[Digits startWithConsumerKey:consumerSecret:]
 *
 *  @param consumerKey    Your Digits application's consumer key.
 *  @param consumerSecret Your Digits application's consumer secret.
 *  @param accessGroup    An optional keychain access group to apply to session objects stored in the keychain.
 *
 *  @note In the majority of situations applications will not need to specify an access group to use with Digits sessions.
 *  This value is only needed if you plan to share credentials with another application that you control or if you are
 *  using Digits with an app extension.
 */
- (void)startWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessGroup:(NSString *)accessGroup;

/**
 *
 *  @return The Digits user session or nil if there's no authenticated user.
 */
- (DGTSession *)session;

/**
 *  Authentication configuration details. Encapsulates the `consumerKey` and `consumerSecret` credentials required to authenticate a Twitter application.
 */
@property (nonatomic, strong, readonly) TWTRAuthConfig *authConfig;

/**
 *  Notifies whenever there have been changes to the Digits Session or if it is no longer a valid session.
 */
@property (nonatomic, weak) id<DGTSessionUpdateDelegate> sessionUpdateDelegate;

/**
 *  Starts the authentication flow UI with the standard appearance. The UI is presented as a modal off of the top-most view controller. The modal title is the application name.
 *
 *  @param completion Block called after the authentication flow has ended.
 */
- (void)authenticateWithCompletion:(DGTAuthenticationCompletion)completion;

/**
 *  Starts the authentication flow UI with the standard appearance. The UI is presented as a modal off of the top-most view controller.
 *
 *  @param title      Title for the modal screens. Pass `nil` to use default app name.
 *  @param completion Block called after the authentication flow has ended.
 */
- (void)authenticateWithTitle:(NSString *)title completion:(DGTAuthenticationCompletion)completion;

/**
 *  Starts the authentication flow UI with the standard appearance.
 *
 *  @param viewController    View controller used to present the modal authentication controller. Pass `nil` to use default top-most view controller.
 *  @param title             Title for the modal screens. Pass `nil` to use default app name.
 *  @param completion        Block called after the authentication flow has ended.
 */
- (void)authenticateWithViewController:(UIViewController *)viewController title:(NSString *)title completion:(DGTAuthenticationCompletion)completion;

/**
 *  Starts the authentication flow UI.
 *
 *  @param appearance        Appearance of the authentication flow views. Pass `nil` to use the default appearance.
 *  @param viewController    View controller used to present the modal authentication controller. Pass `nil` to use default top-most view controller.
 *  @param title             Title for the modal screens. Pass `nil` to use default app name.
 *  @param completion        Block called after the authentication flow has ended.
 */
- (void)authenticateWithDigitsAppearance:(DGTAppearance *)appearance viewController:(UIViewController *)viewController title:(NSString *)title completion:(DGTAuthenticationCompletion)completion;

/**
 *  Starts the authentication flow UI using a predetermined phone number.
 *
 *  @param phoneNumber       Prepopulate the phone number field with this value. Value should be a string containing only numbers, and prefixed with an optional '+' character if the number includes a country dial code. If a '+' is provided, the country dial code will be parsed out and selected from the country picker. You could also pass only the country code using the '+' prefix and only the country picker will be populated, no phone number. Examples: '+15555555555' (USA, 5555555555), '5555555555' (USA, 5555555555), '+345555555555' (Spain, 5555555555), '+52' (Mexico, no number input)
 *  @param appearance        Appearance of the authentication flow views. Pass `nil` to use the default appearance.
 *  @param viewController    View controller used to present the modal authentication controller. Pass `nil` to use default top-most view controller.
 *  @param title             Title for the modal screens. Pass `nil` to use default app name.
 *  @param completion        Block called after the authentication flow has ended.
 */
- (void)authenticateWithPhoneNumber:(NSString *)phoneNumber digitsAppearance:(DGTAppearance *)appearance viewController:(UIViewController *)viewController title:(NSString *)title completion:(DGTAuthenticationCompletion)completion;

/**
 *  Starts the authentication flow in your own navigation UI. Digits view controllers will be pushed into the passed navigation controller and after the flow is done, success or failure; the completion view controller will be pushed into the top of the original stack.
 *
 *  @param navigationController     Navigation controller used to pushed the Digits view into.
 *  @param phoneNumber              Prepopulate the phone number field with this value. Value should be a string containing only numbers, and prefixed with an optional '+' character if the number includes a country dial code. If a '+' is provided, the country dial code will be parsed out and selected from the country picker. You could also pass only the country code using the '+' prefix and only the country picker will be populated, no phone number. Examples: '+15555555555' (USA, 5555555555), '5555555555' (USA, 5555555555), '+345555555555' (Spain, 5555555555), '+52' (Mexico, no number input)
 *  @param appearance               Appearance of the authentication flow views. Pass `nil` to use the default appearance.
 *  @param title                    Title for the auth screens.
 *  @param completionViewController View controller pushed to the navigation controller when the auth flow is completed
 */
- (void)authenticateWithNavigationViewController:(UINavigationController *)navigationController phoneNumber:(NSString *)phoneNumber digitsAppearance:(DGTAppearance *)appearance title:(NSString *)title completionViewController:(UIViewController<DGTCompletionViewController> *)completionViewController;

/**
 *  Deletes the local Twitter user session from this app. This will not remove the system Twitter account nor make a network request to invalidate the session. Subsequent calls to `authenticateWith` methods will start a new Digits authentication flow.
 */
- (void)logOut;

@end
