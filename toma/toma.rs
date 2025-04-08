pub struct Uid(u64);
impl Default for Uid {
    fn default() -> Uid {
        Uid(501)
    }
}
impl Into<u64> for Uid {
    fn into(self) -> u64 {
        self.0
    }
}
impl From<u64> for Uid {
    fn from(u: u64) -> Uid {
        Uid(u)
    }
}
impl From<Option<u64>> for Uid {
    fn from(u: Option<u64>) -> Uid {
        match u {
            Some(u) => Uid(u),
            None => Uid::default(),
        }
    }
}
impl Copy for Uid {}
impl Clone for Uid {
    fn clone(&self) -> Uid {
        Uid(self.0)
    }
}
impl std::str::FromStr for Uid {
    type Err = crate::Error;

    fn from_str(s: &str) -> Result<Uid, crate::Error> {
        Ok(Uid(u64::from_str_radix(s, 10)?))
    }
}
impl std::fmt::Display for Uid {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "{}", self.0)
    }
}
impl std::fmt::Debug for Uid {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "Uid({})", self.0)
    }
}
pub const USER_SERVICES: [&'static str; 19] = [
    "com.apple.AMP",
    "com.apple.AccessibilityVis",
    "com.apple.CoreLocationAgent",
    "com.apple.ScreenTimeAgent",
    "com.apple.accessibility.",
    "com.apple.amp",
    "com.apple.amp.mediasharingd",
    "com.apple.iCloudNotificationAgent",
    "com.apple.noticeboard",
    "com.apple.pbs",
    "com.apple.ptpcamerad",
    "com.apple.replicatord",
    "com.apple.screensharing",
    "com.apple.sharingd",
    "com.apple.siri",
    "com.apple.sociallayerd",
    "com.apple.spotlightknowledged",
    "com.apple.suggestd",
    "com.apple.tipsd",
];
pub const SYSTEM_SERVICES: [&'static str; 34] = [
    "com.apple.wifip2pd",
    "com.apple.airportd",
    "com.apple.touchbarserver",
    "com.apple.cvmsServ",
    "com.apple.mobile.obliteration",
    "com.apple.modelcatalogd",
    "com.apple.deleted_helper",
    "com.apple.avbdeviced",
    "com.apple.ospredictiond",
    "com.apple.storereceiptinstaller",
    "com.apple.bosreporter",
    "com.apple.racoon",
    "com.apple.metadata.mds.scan",
    "com.apple.mediaremoted",
    "com.apple.cameracaptured",
    "com.apple.cloudd",
    "com.apple.nearbyd",
    "com.apple.runningboardd",
    "com.apple.testmanagerd.remote",
    "com.apple.remoted",
    "com.apple.remotemanagementd",
    "com.apple.csrutil.report",
    "com.apple.usbsmartcardreaderd",
    "com.apple.osanalytics.osanalyticshelper",
    "com.apple.adid",
    "com.apple.wifivelocityd",
    "com.apple.liquiddetectiond",
    "com.apple.gamepolicyd",
    "com.apple.eligibilityd",
    "com.apple.fairplaydeviceidentityd",
    "com.apple.findmy.findmybeaconingd",
    "com.apple.GameController.gamecontrollerd",
    "com.apple.triald.system",
    "com.apple.corebrightnessd",
];
