#import <SpringBoard/SpringBoard.h>
#import <AudioToolbox/AudioServices.h>
#import <UIKit/UIKit.h>
//#import <LowBattery.h>

@interface NSObject ()
@property (assign,nonatomic) UIEdgeInsets clippingInsets;
@property (copy, nonatomic) NSString *message;
@property (copy, nonatomic) NSString *subtitle;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *sectionID;
@property (copy, nonatomic) id defaultAction;
+ (id)action;
+ (id)sharedInstance;
- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSInteger)arg3;
- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSInteger)arg3 playLightsAndSirens:(BOOL)arg4 withReply:(id)arg5;
- (void)_replaceIntervalElapsed;
- (void)_dismissIntervalElapsed;
- (BOOL)containsAttachments;
- (void)setSecondaryText:(id)arg1 italicized:(BOOL)arg2;
- (int)_ui_resolvedTextAlignment;

- (UILabel *)tb_titleLabel;
- (void)tb_setTitleLabel:(UILabel *)label;
- (void)tb_setSecondaryLabel:(UILabel *)label;

@end

int limitPopup = 0;
int limitBanner = 0;

%hook SBLowPowerAlertItem

+(unsigned)_thresholdForLevel:(unsigned)level {

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.lowbattery.plist"];

BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];

NSInteger alertType = [[prefs objectForKey:@"alertType"] intValue];

NSInteger firstPopup = [[prefs objectForKey:@"firstPopup"] intValue];
NSInteger secondPopup = [[prefs objectForKey:@"secondPopup"] intValue];
NSInteger thirdPopup = [[prefs objectForKey:@"thirdPopup"] intValue];
NSInteger fourthPopup = [[prefs objectForKey:@"fourthPopup"] intValue];
NSInteger fifthPopup = [[prefs objectForKey:@"fifthPopup"] intValue];

NSString *firstPopupTitle = [prefs objectForKey:@"firstPopupTitle"];
NSString *firstPopupMessage = [prefs objectForKey:@"firstPopupMessage"];
NSString *firstPopupOK = [prefs objectForKey:@"firstPopupOK"];
BOOL firstPopupVibration = [[prefs objectForKey:@"firstPopupVibration"] boolValue];
BOOL firstPopupSound = [[prefs objectForKey:@"firstPopupSound"] boolValue];
NSString *firstPopupCustomSound = [prefs objectForKey:@"firstPopupCustomSound"];

NSString *secondPopupTitle = [prefs objectForKey:@"secondPopupTitle"];
NSString *secondPopupMessage = [prefs objectForKey:@"secondPopupMessage"];
NSString *secondPopupOK = [prefs objectForKey:@"secondPopupOK"];
BOOL secondPopupVibration = [[prefs objectForKey:@"secondPopupVibration"] boolValue];
BOOL secondPopupSound = [[prefs objectForKey:@"secondPopupSound"] boolValue];
NSString *secondPopupCustomSound = [prefs objectForKey:@"secondPopupCustomSound"];

NSString *thirdPopupTitle = [prefs objectForKey:@"thirdPopupTitle"];
NSString *thirdPopupMessage = [prefs objectForKey:@"thirdPopupMessage"];
NSString *thirdPopupOK = [prefs objectForKey:@"thirdPopupOK"];
BOOL thirdPopupVibration = [[prefs objectForKey:@"thirdPopupVibration"] boolValue];
BOOL thirdPopupSound = [[prefs objectForKey:@"thirdPopupSound"] boolValue];
NSString *thirdPopupCustomSound = [prefs objectForKey:@"thirdPopupCustomSound"];

NSString *fourthPopupTitle = [prefs objectForKey:@"fourthPopupTitle"];
NSString *fourthPopupMessage = [prefs objectForKey:@"fourthPopupMessage"];
NSString *fourthPopupOK = [prefs objectForKey:@"fourthPopupOK"];
BOOL fourthPopupVibration = [[prefs objectForKey:@"fourthPopupVibration"] boolValue];
BOOL fourthPopupSound = [[prefs objectForKey:@"fourthPopupSound"] boolValue];
NSString *fourthPopupCustomSound = [prefs objectForKey:@"fourthPopupCustomSound"];


NSString *fifthPopupTitle = [prefs objectForKey:@"fifthPopupTitle"];
NSString *fifthPopupMessage = [prefs objectForKey:@"fifthPopupMessage"];
NSString *fifthPopupOK = [prefs objectForKey:@"fifthPopupOK"];
BOOL fifthPopupVibration = [[prefs objectForKey:@"fifthPopupVibration"] boolValue];
BOOL fifthPopupSound = [[prefs objectForKey:@"fifthPopupSound"] boolValue];
NSString *fifthPopupCustomSound = [prefs objectForKey:@"fifthPopupCustomSound"];


NSInteger firstBanner = [[prefs objectForKey:@"firstBanner"] intValue];
NSInteger secondBanner = [[prefs objectForKey:@"secondBanner"] intValue];
NSInteger thirdBanner = [[prefs objectForKey:@"thirdBanner"] intValue];
NSInteger fourthBanner = [[prefs objectForKey:@"fourthBanner"] intValue];
NSInteger fifthBanner = [[prefs objectForKey:@"fifthBanner"] intValue];


NSString *firstBannerTitle = [prefs objectForKey:@"firstBannerTitle"];
NSString *firstBannerMessage = [prefs objectForKey:@"firstBannerMessage"];
BOOL firstBannerVibration = [[prefs objectForKey:@"firstBannerVibration"] boolValue];
BOOL firstBannerSound = [[prefs objectForKey:@"firstBannerSound"] boolValue];
NSString *firstBannerCustomSound = [prefs objectForKey:@"firstBannerCustomSound"];


NSString *secondBannerTitle = [prefs objectForKey:@"secondBannerTitle"];
NSString *secondBannerMessage = [prefs objectForKey:@"secondBannerMessage"];
BOOL secondBannerVibration = [[prefs objectForKey:@"secondBannerVibration"] boolValue];
BOOL secondBannerSound = [[prefs objectForKey:@"secondBannerSound"] boolValue];
NSString *secondBannerCustomSound = [prefs objectForKey:@"secondBannerCustomSound"];


NSString *thirdBannerTitle = [prefs objectForKey:@"thirdBannerTitle"];
NSString *thirdBannerMessage = [prefs objectForKey:@"thirdBannerMessage"];
BOOL thirdBannerVibration = [[prefs objectForKey:@"thirdBannerVibration"] boolValue];
BOOL thirdBannerSound = [[prefs objectForKey:@"thirdBannerSound"] boolValue];
NSString *thirdBannerCustomSound = [prefs objectForKey:@"thirdBannerCustomSound"];

NSString *fourthBannerTitle = [prefs objectForKey:@"fourthBannerTitle"];
NSString *fourthBannerMessage = [prefs objectForKey:@"fourthBannerMessage"];
BOOL fourthBannerVibration = [[prefs objectForKey:@"fourthBannerVibration"] boolValue];
BOOL fourthBannerSound = [[prefs objectForKey:@"fourthBannerSound"] boolValue];
NSString *fourthBannerCustomSound = [prefs objectForKey:@"fourthBannerCustomSound"];

NSString *fifthBannerTitle = [prefs objectForKey:@"fifthBannerTitle"];
NSString *fifthBannerMessage = [prefs objectForKey:@"fifthBannerMessage"];
BOOL fifthBannerVibration = [[prefs objectForKey:@"fifthBannerVibration"] boolValue];
BOOL fifthBannerSound = [[prefs objectForKey:@"fifthBannerSound"] boolValue];
NSString *fifthBannerCustomSound = [prefs objectForKey:@"fifthBannerCustomSound"];

if (!([firstPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
  firstPopupTitle = [firstPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([firstPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
  firstPopupMessage = [firstPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([firstPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
  firstPopupOK = [firstPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}



if (!([secondPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
  secondPopupTitle = [secondPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([secondPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
  secondPopupMessage = [secondPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([secondPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
  secondPopupOK = [secondPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}


if (!([thirdPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
  thirdPopupTitle = [thirdPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([thirdPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
  thirdPopupMessage = [thirdPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([thirdPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
  thirdPopupOK = [thirdPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}


if (!([fourthPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
  fourthPopupTitle = [fourthPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([fourthPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
  fourthPopupMessage = [fourthPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([fourthPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
  fourthPopupOK = [fourthPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}


if (!([fifthPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
  fifthPopupTitle = [fifthPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([fifthPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
  fifthPopupMessage = [fifthPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([fifthPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
  fifthPopupOK = [fifthPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}


if (!([firstBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
  firstBannerTitle = [firstBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([firstBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
  firstBannerMessage = [firstBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}


if (!([secondBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
  secondBannerTitle = [secondBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([secondBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
  secondBannerMessage = [secondBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}


if (!([thirdBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
  thirdBannerTitle = [thirdBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([thirdBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
  thirdBannerMessage = [thirdBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}


if (!([fourthBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
  fourthBannerTitle = [fourthBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([fourthBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
  fourthBannerMessage = [fourthBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([fifthBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
  fifthBannerTitle = [fifthBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

if (!([fifthBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
  fifthBannerMessage = [fifthBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
}

[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];


    if (enabled) {

	if (!([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging)) {

	    if (alertType == 0) {

		if (level == firstPopup && limitPopup == 0) {

		    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:firstPopupTitle
			 message:firstPopupMessage
			delegate:nil 
			cancelButtonTitle:firstPopupOK 
			otherButtonTitles:nil];
		    [alert show];
		    [alert release];

		if (firstPopupVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (firstPopupSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",firstPopupCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitPopup = 1;

		}

		if (level == secondPopup && limitPopup == 0) {

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

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",secondPopupCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}

		limitPopup = 1;

		}

		if (level == thirdPopup && limitPopup == 0) {

		    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:thirdPopupTitle
			 message:thirdPopupMessage
			delegate:nil 
			cancelButtonTitle:thirdPopupOK 
			otherButtonTitles:nil];
		    [alert show];
		    [alert release];

		if (thirdPopupVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (thirdPopupSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",thirdPopupCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitPopup = 1;

		}

		if (level == fourthPopup && limitPopup == 0) {

		    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:fourthPopupTitle
			 message:fourthPopupMessage
			delegate:nil 
			cancelButtonTitle:fourthPopupOK 
			otherButtonTitles:nil];
		    [alert show];
		    [alert release];

		if (fourthPopupVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (fourthPopupSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",fourthPopupCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitPopup = 1;

		}

		if (level == fifthPopup && limitPopup == 0) {

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

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",fifthPopupCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitPopup = 1;

		}

	    }

	    if (alertType == 2) {
	    }

	    if (alertType == 1) {

		if (level == firstBanner && limitBanner == 0) {

			id request = [[[%c(BBBulletinRequest) alloc] init] autorelease];
			[request setTitle: firstBannerTitle];
			[request setMessage:firstBannerMessage];
			[request setSectionID: @"com.apple.Preferences"];
			[request setDefaultAction: [%c(BBAction) action]];
			id ctrl = [%c(SBBulletinBannerController) sharedInstance];

			if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:playLightsAndSirens:withReply:)]) {
				[ctrl observer:nil addBulletin:request forFeed:2 playLightsAndSirens:YES withReply:nil];
			} else {
				[ctrl observer:nil addBulletin:request forFeed:2];
			}

		if (firstBannerVibration) {
			AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (firstBannerSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",firstBannerCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitBanner = 1;

		}

		if (level == secondBanner && limitBanner == 0) {


			id request = [[[%c(BBBulletinRequest) alloc] init] autorelease];
			[request setTitle: secondBannerTitle];
			[request setMessage:secondBannerMessage];
			[request setSectionID: @"com.apple.Preferences"];
			[request setDefaultAction: [%c(BBAction) action]];
			id ctrl = [%c(SBBulletinBannerController) sharedInstance];

			if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:playLightsAndSirens:withReply:)]) {
				[ctrl observer:nil addBulletin:request forFeed:2 playLightsAndSirens:YES withReply:nil];
			} else {
				[ctrl observer:nil addBulletin:request forFeed:2];
			}

		if (secondBannerVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (secondBannerSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",secondBannerCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitBanner = 1;

		}

		if (level == thirdBanner && limitBanner == 0) {


			id request = [[[%c(BBBulletinRequest) alloc] init] autorelease];
			[request setTitle: thirdBannerTitle];
			[request setMessage:thirdBannerMessage];
			[request setSectionID: @"com.apple.Preferences"];
			[request setDefaultAction: [%c(BBAction) action]];
			id ctrl = [%c(SBBulletinBannerController) sharedInstance];

			if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:playLightsAndSirens:withReply:)]) {
				[ctrl observer:nil addBulletin:request forFeed:2 playLightsAndSirens:YES withReply:nil];
			} else {
				[ctrl observer:nil addBulletin:request forFeed:2];
			}


		if (thirdBannerVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (thirdBannerSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",thirdBannerCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitBanner = 1;

		}

		if (level == fourthBanner && limitBanner == 0) {


			id request = [[[%c(BBBulletinRequest) alloc] init] autorelease];
			[request setTitle: fourthBannerTitle];
			[request setMessage:fourthBannerMessage];
			[request setSectionID: @"com.apple.Preferences"];
			[request setDefaultAction: [%c(BBAction) action]];
			id ctrl = [%c(SBBulletinBannerController) sharedInstance];

			if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:playLightsAndSirens:withReply:)]) {
				[ctrl observer:nil addBulletin:request forFeed:2 playLightsAndSirens:YES withReply:nil];
			} else {
				[ctrl observer:nil addBulletin:request forFeed:2];
			}

		
		if (fourthBannerVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (fourthBannerSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",fourthBannerCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitBanner = 1;

		}

		if (level == fifthBanner && limitBanner == 0) {


			id request = [[[%c(BBBulletinRequest) alloc] init] autorelease];
			[request setTitle: fifthBannerTitle];
			[request setMessage:fifthBannerMessage];
			[request setSectionID: @"com.apple.Preferences"];
			[request setDefaultAction: [%c(BBAction) action]];
			id ctrl = [%c(SBBulletinBannerController) sharedInstance];

			if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:playLightsAndSirens:withReply:)]) {
				[ctrl observer:nil addBulletin:request forFeed:2 playLightsAndSirens:YES withReply:nil];
			} else {
				[ctrl observer:nil addBulletin:request forFeed:2];
			}

		
		if (fifthBannerVibration) {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		}

		if (fifthBannerSound) {

		    SystemSoundID selectedSound = 0;

			AudioServicesDisposeSystemSoundID(selectedSound);

		    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/LowBattery/Sounds/%@",fifthBannerCustomSound]],&selectedSound);
			AudioServicesPlaySystemSound(selectedSound);

		}


		limitBanner = 1;

		}


	    }

	} else if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging) {
	}

	if ((level == firstPopup-1 || level == firstPopup+1 || level == secondPopup-1 || level == secondPopup+1 || level == thirdPopup-1 || level == thirdPopup+1 || level == fourthPopup-1 || level == fourthPopup+1 || level == fifthPopup-1 || level == fifthPopup+1) && limitPopup == 1) {
	    limitPopup = 0;
	}

	if ((level == firstBanner-1 || level == firstBanner+1 || level == secondBanner-1 || level == secondBanner+1 || level == thirdBanner-1 || level == thirdBanner+1 || level == fourthBanner-1 || level == fourthBanner+1 || level == fifthBanner-1 || level == fifthBanner+1) && limitBanner == 1) {
	    limitBanner = 0;
	}

    }

    else if (!enabled) {
	return %orig;
    }

    return 99;
}

%end