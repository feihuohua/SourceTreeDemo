
#import "ATAppUpdater.h"

@implementation ATAppUpdater


#pragma mark - Init


+ (id)sharedUpdater
{
    static ATAppUpdater *sharedUpdater;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUpdater = [[ATAppUpdater alloc] init];
    });
    return sharedUpdater;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.alertTitle = @"新版本更新提示";
        self.alertMessage = @"可以在appStore下载新版本 %@ ";
        self.alertUpdateButtonTitle = @"立即更新";
        self.alertCancelButtonTitle = @"以后再说";
    }
    return self;
}


#pragma mark - Instance Methods


- (void)showUpdateWithForce
{
    BOOL hasConnection = [self hasConnection];
    if (!hasConnection) return;
    
    [self checkNewAppVersion:^(BOOL newVersion, NSString *version) {
        if (newVersion) [self alertUpdateForVersion:version withForce:YES];
    }];
}

- (void)showUpdateWithConfirmation
{
    BOOL hasConnection = [self hasConnection];
    if (!hasConnection) return;
    
    [self checkNewAppVersion:^(BOOL newVersion, NSString *version) {
        if (newVersion) [self alertUpdateForVersion:version withForce:NO];
    }];
}


#pragma mark - Private Methods


- (BOOL)hasConnection
{
    const char *host = "itunes.apple.com";
    BOOL reachable;
    BOOL success;
    
    // Link SystemConfiguration.framework! <SystemConfiguration/SystemConfiguration.h>
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host);
    SCNetworkReachabilityFlags flags;
    success = SCNetworkReachabilityGetFlags(reachability, &flags);
    reachable = success && (flags & kSCNetworkFlagsReachable) && !(flags & kSCNetworkFlagsConnectionRequired);
    CFRelease(reachability);
    return reachable;
}

NSString *appStoreURL = nil;

- (void)checkNewAppVersion:(void(^)(BOOL newVersion, NSString *version))completion
{
    NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleIdentifier = bundleInfo[@"CFBundleIdentifier"];
    NSString *currentVersion = bundleInfo[@"CFBundleShortVersionString"];
    NSURL *lookupURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/lookup?bundleId=%@", bundleIdentifier]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void) {
        
        NSData *lookupResults = [NSData dataWithContentsOfURL:lookupURL];
        if (!lookupResults) {
            completion(NO, nil);
            return;
        }
        
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:lookupResults options:0 error:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            NSUInteger resultCount = [jsonResults[@"resultCount"] integerValue];
            if (resultCount){
                NSDictionary *appDetails = [jsonResults[@"results"] firstObject];
                NSString *appItunesUrl = [appDetails[@"trackViewUrl"] stringByReplacingOccurrencesOfString:@"&uo=4" withString:@""];
                NSString *latestVersion = appDetails[@"version"];

                if ([latestVersion compare:currentVersion options:NSNumericSearch] == NSOrderedDescending) {
                    appStoreURL = appItunesUrl;
                    completion(YES, latestVersion);
                } else {
                    completion(NO, nil);
                }
            } else {
                completion(NO, nil);
            }
        });
    });
}

- (void)alertUpdateForVersion:(NSString *)version withForce:(BOOL)force
{
    NSString *alertMessage = [NSString stringWithFormat:self.alertMessage, version];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:self.alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *updateAction = [UIAlertAction actionWithTitle:self.alertUpdateButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appStoreURL]];
        if ([self.delegate respondsToSelector:@selector(appUpdaterUserDidLaunchAppStore)]) {
            [self.delegate appUpdaterUserDidLaunchAppStore];
        }
    }];
    [alert addAction:updateAction];
    
    if (!force) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:self.alertCancelButtonTitle style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([self.delegate respondsToSelector:@selector(appUpdaterUserDidCancel)]) {
                [self.delegate appUpdaterUserDidCancel];
            }
        }];
        [alert addAction:cancelAction];
    }
    
    [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alert animated:YES completion:^{
        if ([self.delegate respondsToSelector:@selector(appUpdaterDidShowUpdateDialog)]) {
            [self.delegate appUpdaterDidShowUpdateDialog];
        }
    }];
}

@end
