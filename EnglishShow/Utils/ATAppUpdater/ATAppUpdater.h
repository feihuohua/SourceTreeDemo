
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>

@protocol ATAppUpdaterDelegate <NSObject>
@optional

/** Will be called when the update alert has shown. */
- (void)appUpdaterDidShowUpdateDialog;

/** Will be called when the user selected to update now. */
- (void)appUpdaterUserDidLaunchAppStore;

/** Will be called when the user selected not to update now. */
- (void)appUpdaterUserDidCancel;

@end


@interface ATAppUpdater : NSObject

/** Delegate to handle the user's actions when prompted to update. */
@property (nonatomic, weak) id <ATAppUpdaterDelegate> delegate;

/** Set the UIAlertView title. NSLocalizedString() supported. */
@property (nonatomic, weak) NSString *alertTitle;

/** Set the UIAlertView alert message. NSLocalizedString() supported. */
@property (nonatomic, weak) NSString *alertMessage;

/** Set the UIAlertView update button's title. NSLocalizedString() supported. */
@property (nonatomic, weak) NSString *alertUpdateButtonTitle;

/** Set the UIAlertView cancel button's title. NSLocalizedString() supported. */
@property (nonatomic, weak) NSString *alertCancelButtonTitle;


/** Shared instance. [ATAppUpdater sharedUpdater] */
+ (id)sharedUpdater;

/** Checks for newer version and show alert without a cancel button. */
- (void)showUpdateWithForce;

/** Checks for newer version and show alert with a cancel button. */
- (void)showUpdateWithConfirmation;

@end
