include vendor/opengapps/build/core/definitions.mk
include vendor/opengapps/build/config.mk
include vendor/opengapps/build/opengapps-files.mk

ifneq ($(filter pico,$(TARGET_GAPPS_VARIANT)),) # require at least pico
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/pico

GAPPS_PRODUCT_PACKAGES += \
    Feedback \
    GoogleBackupTransport \
    GoogleContactsSyncAdapter \
    GoogleServicesFramework \
    GoogleCalendarSyncAdapter

ifneq ($(filter 23,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    GoogleTTS \
    GooglePackageInstaller
endif

ifneq ($(filter 24,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    PrebuiltGmsCoreInstantApps
endif

ifneq ($(filter 25,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    Turbo
endif

ifneq ($(filter 26,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    AndroidPlatformServices
endif

ifneq ($(filter nano,$(TARGET_GAPPS_VARIANT)),) # require at least nano
GAPPS_PRODUCT_PACKAGES += \
    FaceLock \
    Velvet \
    PrebuiltGmsCore \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GoogleLoginService \
    SetupWizard \
    Phonesky

ifneq ($(filter micro,$(TARGET_GAPPS_VARIANT)),) # require at least micro
GAPPS_PRODUCT_PACKAGES += \
    CalendarGooglePrebuilt \
    PrebuiltExchange3Google \
    PrebuiltGmail \
    GoogleHome

ifeq ($(filter 23,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    GoogleTTS
endif

ifneq ($(filter mini,$(TARGET_GAPPS_VARIANT)),) # require at least mini
GAPPS_PRODUCT_PACKAGES += \
    CalculatorGoogle \
    PrebuiltDeskClockGoogle \
    PlusOne \
    Hangouts \
    Maps \
    Photos \
    YouTube

ifneq ($(filter full,$(TARGET_GAPPS_VARIANT)),) # require at least full

GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_PRODUCT_PACKAGES += \
    Books \
    CloudPrint2 \
    EditorsDocs \
    Drive \
    FitnessPrebuilt \
    PrebuiltKeep \
    Videos \
    Music2 \
    Newsstand \
    PrebuiltNewsWeather \
    PlayGames \
    EditorsSheets \
    EditorsSlides \
    talkback

ifneq ($(filter stock,$(TARGET_GAPPS_VARIANT)),) # require at least stock

GAPPS_FORCE_MMS_OVERRIDES := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_PRODUCT_PACKAGES += \
    GoogleCamera \
    GoogleContacts \
    LatinImeGoogle \
    TagGoogle \
    GoogleVrCore

ifneq ($(filter 23,$(call get-allowed-api-levels)),)
GAPPS_FORCE_DIALER_OVERRIDES := true
endif
ifneq ($(filter 24,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    GooglePrintRecommendationService \
    GoogleExtServices \
    GoogleExtShared
endif

ifneq ($(filter super,$(TARGET_GAPPS_VARIANT)),)

GAPPS_PRODUCT_PACKAGES += \
    Wallet \
    DMAgent \
    GoogleEarth \
    GCS \
    GoogleHindiIME \
    GoogleJapaneseInput \
    KoreanIME \
    GooglePinyinIME \
    Tycho \
    Street \
    TranslatePrebuilt \
    GoogleZhuyinIME

endif # end super
endif # end stock
endif # end full
endif # end mini
endif # end micro
endif # end nano

ifeq ($(GAPPS_FORCE_WEBVIEW_OVERRIDES),true)
# starting with nougat, use a different overlay
ifneq ($(filter 24,$(call get-allowed-api-levels)),)
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/webview/24
else
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/webview/21
endif
PRODUCT_PACKAGES += \
    WebViewGoogle
endif

ifeq ($(GAPPS_FORCE_BROWSER_OVERRIDES),true)
ifneq ($(filter 23,$(call get-allowed-api-levels)),)
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/browser
endif
PRODUCT_PACKAGES += \
    Chrome
endif

ifneq ($(filter 23,$(call get-allowed-api-levels)),)
ifeq ($(GAPPS_FORCE_DIALER_OVERRIDES),true)
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/dialer

PRODUCT_PACKAGES += \
    GoogleDialer
endif
endif

ifeq ($(GAPPS_FORCE_MMS_OVERRIDES),true)
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/mms

PRODUCT_PACKAGES += \
    PrebuiltBugle
endif

ifeq ($(GAPPS_FORCE_PIXEL_LAUNCHER),true)

ifneq ($(filter 26,$(call get-allowed-api-levels)),)
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/pixelicons/26
else ifneq ($(filter 25,$(call get-allowed-api-levels)),)
DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/pixelicons/25
endif

ifneq ($(filter 25,$(call get-allowed-api-levels)),)
PRODUCT_PACKAGES += \
    PixelLauncherIcons
endif

PRODUCT_PACKAGES += \
    PixelLauncher \
    Wallpapers
endif

endif # end pico

ifneq ($(filter tvstock,$(TARGET_GAPPS_VARIANT)),) # does not contain any other variant

GAPPS_PRODUCT_PACKAGES += \
    GooglePackageInstaller \
    GoogleBackupTransport \
    GoogleServicesFramework \
    WebViewGoogle \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    BugReportSender \
    ConfigUpdater \
    NoTouchAuthDelegate \
    PrebuiltGmsCorePano \
    Tubesky \
    Backdrop \
    AndroidMediaShell \
    TV \
    Overscan \
    RemoteControlService \
    SecondScreenSetup \
    SecondScreenSetupAuthBridge \
    talkbackLeanback \
    LeanbackLauncher \
    VideosPano \
    Music2Pano \
    PlayGamesLeanback \
    Katniss \
    AtvWidget \
    YouTubeLeanback \
    SetupWraith \
    AtvRemoteService

ifneq ($(filter 24,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    GoogleExtServices \
    GoogleExtShared \
    LandscapeWallpaper \
    LeanbackIme
endif

ifneq ($(filter 26,$(call get-allowed-api-levels)),)
GAPPS_PRODUCT_PACKAGES += \
    TVLauncher \
    TVRecommendations \
    TvTutorials \
    AndroidPlatformServicesTV
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.error.receiver.system.apps=com.google.android.gms

DEVICE_PACKAGE_OVERLAYS += \
    $(GAPPS_DEVICE_FILES_PATH)/overlay/webview/24

endif # end tvstock

# This needs to be at the end of standard files, but before the GAPPS_FORCE_* options,
# since those also affect DEVICE_PACKAGE_OVERLAYS. We don't want to exclude a package
# that also has an overlay, since that will make us use the overlay but not have the
# package. This can cause issues.
PRODUCT_PACKAGES += $(filter-out $(GAPPS_EXCLUDED_PACKAGES),$(GAPPS_PRODUCT_PACKAGES))
