ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = LowBattery
LowBattery_FILES = LowBattery.mm FirstPopup.mm SecondPopup.mm ThirdPopup.mm FourthPopup.mm FifthPopup.mm FirstBanner.mm SecondBanner.mm ThirdBanner.mm FourthBanner.mm FifthBanner.mm
LowBattery_INSTALL_PATH = /Library/PreferenceBundles
LowBattery_FRAMEWORKS = UIKit AudioToolbox Social
LowBattery_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/Application\ Support/LowBattery/Sounds$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LowBattery.plist$(ECHO_END)
