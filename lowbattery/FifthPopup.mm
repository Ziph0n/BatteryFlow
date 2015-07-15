#import <Preferences/Preferences.h>
#import <AudioToolbox/AudioServices.h>
#import <UIKit/UIKit.h>

@interface FifthPopup: PSListController {
    NSArray *directoryContent;
    SystemSoundID selectedSound;
}
    - (NSArray *)getValues:(id)target;
    - (void)previewAndSet:(id)value forSpecifier:(id)specifier;
@end

@implementation FifthPopup
- (id)specifiers {
    directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/LowBattery/Sounds/" error:NULL];
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FifthPopup" target:self] retain];

	UIBarButtonItem *previewButton([[UIBarButtonItem alloc] initWithTitle:@"Preview" style:UIBarButtonItemStyleDone target:self action:@selector(preview:)]);
	    previewButton.tag = 1;
	    [[self navigationItem] setRightBarButtonItem:previewButton];
	    [previewButton release];
	}
	return _specifiers;
}

- (void)preview:(id)arg1 {

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.lowbattery.plist"];

NSString *fifthPopupTitle = [prefs objectForKey:@"fifthPopupTitle"];
NSString *fifthPopupMessage = [prefs objectForKey:@"fifthPopupMessage"];
NSString *fifthPopupOK = [prefs objectForKey:@"fifthPopupOK"];
BOOL fifthPopupVibration = [[prefs objectForKey:@"fifthPopupVibration"] boolValue];
BOOL fifthPopupSound = [[prefs objectForKey:@"fifthPopupSound"] boolValue];
NSString *fifthPopupCustomSound = [prefs objectForKey:@"fifthPopupCustomSound"];

	if ([fifthPopupTitle isEqualToString:@""] || [fifthPopupMessage isEqualToString:@""] || [fifthPopupOK isEqualToString:@""]) {
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
			message:@"The title, the message or the OK button of the popup is empty. Please enter a text for each part of the popup :)"
			delegate:nil 
			cancelButtonTitle:@"Okay, will do that now!" 
			otherButtonTitles:nil];
		    [alert show];
		    [alert release];

	} else {

		    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:fifthPopupTitle
			 message:fifthPopupMessage
			delegate:nil 
			cancelButtonTitle:fifthPopupOK 
			otherButtonTitles:nil];
		    [alert show];
		    [alert release];

		if (fifthPopupVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (fifthPopupSound) {

		    SystemSoundID previewSound = 0;

			AudioServicesDisposeSystemSoundID(previewSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",fifthPopupCustomSound]],&previewSound);
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