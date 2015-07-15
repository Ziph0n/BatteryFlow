#import <Preferences/Preferences.h>
#import <AudioToolbox/AudioServices.h>
#import <UIKit/UIKit.h>

@interface SecondPopup: PSListController {
    NSArray *directoryContent;
    SystemSoundID selectedSound;
}
    - (NSArray *)getValues:(id)target;
    - (void)previewAndSet:(id)value forSpecifier:(id)specifier;
@end

@implementation SecondPopup
- (id)specifiers {
    directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/LowBattery/Sounds/" error:NULL];
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SecondPopup" target:self] retain];

	UIBarButtonItem *previewButton([[UIBarButtonItem alloc] initWithTitle:@"Preview" style:UIBarButtonItemStyleDone target:self action:@selector(preview:)]);
	    previewButton.tag = 1;
	    [[self navigationItem] setRightBarButtonItem:previewButton];
	    [previewButton release];
	}
	return _specifiers;
}

- (void)preview:(id)arg1 {

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.lowbattery.plist"];

NSString *secondPopupTitle = [prefs objectForKey:@"secondPopupTitle"];
NSString *secondPopupMessage = [prefs objectForKey:@"secondPopupMessage"];
NSString *secondPopupOK = [prefs objectForKey:@"secondPopupOK"];
BOOL secondPopupVibration = [[prefs objectForKey:@"secondPopupVibration"] boolValue];
BOOL secondPopupSound = [[prefs objectForKey:@"secondPopupSound"] boolValue];
NSString *secondPopupCustomSound = [prefs objectForKey:@"secondPopupCustomSound"];

	if ([secondPopupTitle isEqualToString:@""] || [secondPopupMessage isEqualToString:@""] || [secondPopupOK isEqualToString:@""]) {
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
			message:@"The title, the message or the OK button of the popup is empty. Please enter a text for each part of the popup :)"
			delegate:nil 
			cancelButtonTitle:@"Okay, will do that now!" 
			otherButtonTitles:nil];
		    [alert show];
		    [alert release];
	} else {

		    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:secondPopupTitle
			 message:secondPopupMessage
			delegate:nil 
			cancelButtonTitle:secondPopupOK 
			otherButtonTitles:nil];
		    [alert show];
		    [alert release];

		if (secondPopupVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (secondPopupSound) {

		    SystemSoundID previewSound = 0;

			AudioServicesDisposeSystemSoundID(previewSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",secondPopupCustomSound]],&previewSound);
			AudioServicesPlaySystemSound(previewSound);

		}
	}
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

-(void)save
{
    [self.view endEditing:YES];
}

@end

// vim:ft=objc