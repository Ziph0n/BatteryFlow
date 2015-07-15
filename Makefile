ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = LowBattery
LowBattery_FILES = Tweak.xm
LowBattery_FRAMEWORKS = UIKit AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += lowbattery
include $(THEOS_MAKE_PATH)/aggregate.mk
