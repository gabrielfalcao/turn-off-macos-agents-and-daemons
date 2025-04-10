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
pub const USER_SERVICES: [&'static str; 821] = include!("agents-and-daemons.noon");
pub const SYSTEM_SERVICES: [&'static str; 821] = include!("agents-and-daemons.noon");
