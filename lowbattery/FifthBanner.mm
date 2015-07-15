#import <Preferences/Preferences.h>
#import <AudioToolbox/AudioServices.h>
#import <UIKit/UIKit.h>


@interface FifthBanner: PSListController {
    NSArray *directoryContent;
    SystemSoundID selectedSound;
}
    - (NSArray *)getValues:(id)target;
    - (void)previewAndSet:(id)value forSpecifier:(id)specifier;
@end

@implementation FifthBanner
- (id)specifiers {
    directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/LowBattery/Sounds/" error:NULL];
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FifthBanner" target:self] retain];
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

-(void)save
{
    [self.view endEditing:YES];
}

@end

// vim:ft=objc