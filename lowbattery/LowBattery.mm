#import <Preferences/Preferences.h>
#import <AudioToolbox/AudioServices.h>
#import <Social/SLComposeViewController.h>
#import <Social/SLServiceTypes.h>
#import <UIKit/UIKit.h>

@interface LowBatteryListController: PSListController {
    NSMutableDictionary *prefs;
    NSArray *directoryContent;
    SystemSoundID selectedSound;
}
    - (NSArray *)getValues:(id)target;
    - (void)previewAndSet:(id)value forSpecifier:(id)specifier;
@end

@implementation LowBatteryListController
- (id)specifiers {
    directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/LowBattery/Sounds/" error:NULL];
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LowBattery" target:self] retain];

	UIBarButtonItem *shareButton ([[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(composeTweet:)]);
	shareButton.tag = 1;
	[[self navigationItem] setRightBarButtonItem:shareButton];
	[shareButton release];
	}
	return _specifiers;
}

- (void)previewAndSet:(id)value forSpecifier:(id)specifier{
    // Sample sound and set
    AudioServicesDisposeSystemSoundID(selectedSound);
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",value]],&selectedSound);
    AudioServicesPlaySystemSound(selectedSound);
    
    [super setPreferenceValue:value specifier:specifier];
}

// List our directory content
- (NSArray *)getValues:(id)target{
	NSMutableArray *listing = [NSMutableArray arrayWithObjects:@"None",nil];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pathExtension != ''"];
    for (NSURL *fileURL in [directoryContent filteredArrayUsingPredicate:predicate]) {
	[listing addObject:fileURL];
    }
    return listing;
}

-(void)composeTweet:(id)sender
{
	SLComposeViewController * composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
	[composeController setInitialText:@"I'm using BatteryFlow, an awesome Cydia tweak by @Ziph0n. Get it now!"];
	[self.parentController presentViewController:composeController animated:YES completion:nil];
}

- (void)twitter {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetbot:///user_profile/Ziph0n"]];
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitterrific:///profile?screen_name=Ziph0n"]];
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetings:///user?screen_name=Ziph0n"]];
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=Ziph0n"]];
    else
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/Ziph0n"]];
}

- (void)sourceOnGithub {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Ziph0n/BatteryFlow/tree/master"]];
}

- (void)reddit {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/user/Ziph0n/"]];
}

-(void) sendEmail {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:ziph0ntweak@gmail.com?subject=BatteryFlow"]];
}


@end

// vim:ft=objc
