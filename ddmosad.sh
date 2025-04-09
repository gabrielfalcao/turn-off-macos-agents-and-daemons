#!/bin/sh

target_dir="${DEFAULTS_DIR:-defaults}/$(date +"%Y-%m-%d_%H%M%S")"
defaults_delete() {
    target_path="$target_dir/$1"
    mkdir -p "$target_dir"
    1>/dev/random echo "defaults delete $1 -"
    2>/dev/null 1>/dev/null sudo defaults export $1 "$target_path"
    2>/dev/null 1>/dev/null sudo defaults delete $1
    2>/dev/null 1>/dev/null defaults export $1 "$target_path"
    2>/dev/null 1>/dev/null defaults delete $1
}
defaults_delete_key() {
    for domain in $(2>/dev/random sudo defaults find $1 | grep Found | sed "s,^.*'\([^']\+\)'.*,\1,g"); do
        sudo defaults delete $domain $1
    done
    for domain in $(2>/dev/random defaults find $1 | grep Found | sed "s,^.*'\([^']\+\)'.*,\1,g"); do
        defaults delete $domain $1
    done
}
defaults_write_0() {
    for domain in $(2>/dev/random sudo defaults find $1 | grep Found | sed "s,^.*'\([^']\+\)'.*,\1,g"); do
        sudo defaults write $domain $1 0
    done
    for domain in $(2>/dev/random defaults find $1 | grep Found | sed "s,^.*'\([^']\+\)'.*,\1,g"); do
        defaults write $domain $1 0
    done
}
defaults_delete ZoomChat
defaults_delete codes.poems.wm_tremolo
defaults_delete com.Syncrosoft.LCC
defaults_delete com.TODO.wm_tremolo
defaults_delete com.apple.AMPLibraryAgent
defaults_delete com.apple.Accessibility
defaults_delete com.apple.Accessibility-Settings.extension
defaults_delete com.apple.Accessibility.Assets
defaults_delete com.apple.ActivityMonitor
defaults_delete com.apple.AdLib
defaults_delete com.apple.AddressBook
defaults_delete com.apple.AppleIntelligenceReport
defaults_delete com.apple.AppleMediaServices
defaults_delete com.apple.AppleMediaServices.notbackedup
defaults_delete com.apple.AppleMultitouchMouse
defaults_delete com.apple.AvatarUI.Staryu
defaults_delete com.apple.BKAgentService
defaults_delete com.apple.BluetoothFileExchange
defaults_delete com.apple.CallHistorySyncHelper
defaults_delete com.apple.Chess
defaults_delete com.apple.CloudSubscriptionFeatures.cache
defaults_delete com.apple.CloudSubscriptionFeatures.config
defaults_delete com.apple.CloudSubscriptionFeatures.gmCache
defaults_delete com.apple.CloudTelemetryService.xpc
defaults_delete com.apple.CommCenter.counts
defaults_delete com.apple.CoreGraphics
defaults_delete com.apple.CrashReporter
defaults_delete com.apple.DataDeliveryServices
defaults_delete com.apple.DiscHelper
defaults_delete com.apple.DuetExpertCenter.AppPredictionExpert
defaults_delete com.apple.EscrowSecurityAlert
defaults_delete com.apple.GEO
defaults_delete com.apple.HearingAids
defaults_delete com.apple.IFTelemetrySELFIngestor
defaults_delete com.apple.LaunchServices
defaults_delete com.apple.Maps
defaults_delete com.apple.Maps.mapssyncd
defaults_delete com.apple.MobileSMS
defaults_delete com.apple.Music
defaults_delete com.apple.Notes
defaults_delete com.apple.PersonalAudio
defaults_delete com.apple.Preview.ViewState
defaults_delete com.apple.ProblemReporter
defaults_delete com.apple.QuickTimePlayerX
defaults_delete com.apple.ReportCrash
defaults_delete com.apple.STMExtension.Mail
defaults_delete com.apple.SafariTechnologyPreview
defaults_delete com.apple.ScreenTimeAgent
defaults_delete com.apple.ServicesMenu.Services
defaults_delete com.apple.Siri.SiriTodayExtension
defaults_delete com.apple.SiriNCService
defaults_delete com.apple.SpeakSelection
defaults_delete com.apple.SpeechRecognitionCore
defaults_delete com.apple.StorageManagement.Service
defaults_delete com.apple.TTY
defaults_delete com.apple.TV
defaults_delete com.apple.TelephonyUtilities
defaults_delete com.apple.TelephonyUtilities.sharePlayAppPolicies
defaults_delete com.apple.TestFlight
defaults_delete com.apple.TextEdit
defaults_delete com.apple.UnifiedAssetFramework
defaults_delete com.apple.VoiceMemos
defaults_delete com.apple.VoiceOver4.local
defaults_delete com.apple.VoiceOverUtility
defaults_delete com.apple.Wallpaper-Settings.extension
defaults_delete com.apple.WatchListKit
defaults_delete com.apple.accessibility.heard
defaults_delete com.apple.amp.mediasharingd
defaults_delete com.apple.amsengagementd
defaults_delete com.apple.animoji
defaults_delete com.apple.archiveutility
defaults_delete com.apple.assistantd
defaults_delete com.apple.biomesyncd
defaults_delete com.apple.bookdatastored
defaults_delete com.apple.calaccessd
defaults_delete com.apple.chronod
defaults_delete com.apple.classroom
defaults_delete com.apple.cloudd
defaults_delete com.apple.cloudpaird
defaults_delete com.apple.commerce.knownclients
defaults_delete com.apple.coreservices.uiagent
defaults_delete com.apple.corespotlightui
defaults_delete com.apple.diskspaced
defaults_delete com.apple.driver.AppleBluetoothMultitouch.mouse
defaults_delete com.apple.dt.Xcode
defaults_delete com.apple.finder
defaults_delete com.apple.findmy
defaults_delete com.apple.frameworks.diskimages.diuiagent
defaults_delete com.apple.gamed
defaults_delete com.apple.homeenergyd
defaults_delete com.apple.iApps
defaults_delete com.apple.iBooksX
defaults_delete com.apple.iCal
defaults_delete com.apple.iCloudNotificationAgent
defaults_delete com.apple.ibtool
defaults_delete com.apple.icloud.gm
defaults_delete com.apple.icloud.searchpartyuseragent
defaults_delete com.apple.iclouddrive.features
defaults_delete com.apple.imagecapture
defaults_delete com.apple.imdpersistence.IMDPersistenceAgent
defaults_delete com.apple.inputAnalytics.IASGenmojiAnalyzer
defaults_delete com.apple.inputAnalytics.IASSRAnalyzer
defaults_delete com.apple.inputAnalytics.IASWTAnalyzer
defaults_delete com.apple.inputmethod.Kotoeri
defaults_delete com.apple.itunescloud.daemon
defaults_delete com.apple.java.util.prefs
defaults_delete com.apple.keyboardservicesd
defaults_delete com.apple.keychainaccess
defaults_delete com.apple.lighthouse.dill.BiomeSELFIngestor
defaults_delete com.apple.lighthouse.siri.IFTranscriptIngestor
defaults_delete com.apple.madrid
defaults_delete com.apple.mail
defaults_delete com.apple.mediaanalysisd
defaults_delete com.apple.menuextra.textinput
defaults_delete com.apple.mlhost
defaults_delete com.apple.mlruntimed
defaults_delete com.apple.mobiletimer
defaults_delete com.apple.mobiletimerd
defaults_delete com.apple.ncprefs
defaults_delete com.apple.networkserviceproxy
defaults_delete com.apple.news.tag
defaults_delete com.apple.newscore
defaults_delete com.apple.notificationcenterui
defaults_delete com.apple.onetimepasscodes
defaults_delete com.apple.photoanalysisd
defaults_delete com.apple.photolibraryd
defaults_delete com.apple.photos.shareddefaults
defaults_delete com.apple.preferences.softwareupdate
defaults_delete com.apple.print.add
defaults_delete com.apple.proactive.PersonalizationPortrait
defaults_delete com.apple.screencaptureui
defaults_delete com.apple.security.cloudkeychainproxy3.keysToRegister
defaults_delete com.apple.security.pboxd
defaults_delete com.apple.seserviced
defaults_delete com.apple.siri.VoiceShortcuts
defaults_delete com.apple.siri.media-indexer
defaults_delete com.apple.siri.morphun
defaults_delete com.apple.siri.shortcuts
defaults_delete com.apple.siriactionsd
defaults_delete com.apple.siriknowledged
defaults_delete com.apple.sociallayerd
defaults_delete com.apple.sociallayerd.CloudKit.ckwriter
defaults_delete com.apple.speakerrecognition
defaults_delete com.apple.spotlightknowledge
defaults_delete com.apple.stickersd
defaults_delete com.apple.stocks.account
defaults_delete com.apple.stocks.detailintents
defaults_delete com.apple.stocks.stockskit
defaults_delete com.apple.stocks2
defaults_delete com.apple.suggestd
defaults_delete com.apple.syncdefaultsd
defaults_delete com.apple.syncserver
defaults_delete com.apple.talagent
defaults_delete com.apple.timemachine.HelperAgent
defaults_delete com.apple.tipsd
defaults_delete com.apple.translationd
defaults_delete com.apple.transparencyd
defaults_delete com.apple.universalaccess
defaults_delete com.apple.universalaccessAuthWarning
defaults_delete com.apple.visualintelligence
defaults_delete com.apple.voiceservices
defaults_delete com.apple.weather.sensitive
defaults_delete com.apple.weather.widget
defaults_delete com.brave.Browser
defaults_delete com.com.JUCE.PlayingSoundFilesTutorial
defaults_delete com.epicgames.EpicGamesModSdk
defaults_delete com.google.Chrome.canary
defaults_delete com.google.Keystone.Agent
defaults_delete com.google.chrome
defaults_delete com.google.chrome.for.testing
defaults_delete com.juce.audiopluginhost
defaults_delete com.qtproject
defaults_delete com.vivaldi.Vivaldi
defaults_delete group.com.apple.photolibraryd.private
defaults_delete org.chromium.Chromium
defaults_delete org.mozilla.firefox
defaults_delete org.openemu.OpenEmu
defaults_delete org.sparkle-project.Sparkle.Autoupdate
defaults_delete org.videolan.vlc
defaults_delete pbs
defaults_delete systemgroup.com.apple.icloud.searchpartyd.sharedsettings

defaults write com.apple.dock "wvous-br-corner" 0
defaults write com.apple.dock "showAppExposeGestureEnabled" 0
defaults write com.apple.dock "show-recents" 0
defaults delete com.apple.Multitouch.preferencesBackup 22F82 com.apple.driver.AppleBluetoothMultitouch.trackpad
defaults delete com.apple.Multitouch.preferencesBackup 22F82 com.apple.driver.AppleBluetoothMultitouch.mouse
defaults_delete_key SUSendProfileInfo
defaults_delete_key SUEnableAutomaticChecks
defaults_delete_key SUScheduledCheckInterval
defaults_delete_key SULastCheckTime
defaults_delete_key NSNavLastRootDirectory
defaults_delete_key ApplePersistenceIgnoreState
defaults_delete_key Show_LCC_Welcome_on_LCC_Launch
defaults_delete_key Show_Maintenance_on_LCC_Launch
defaults_write_0 SUAutomaticallyUpdate
