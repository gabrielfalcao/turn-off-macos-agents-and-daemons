use std::fmt::Display;

use serde::ser::SerializeStruct;
use serde::{Serialize, Serializer};

#[derive(Debug, Clone)]
pub enum Error {
    IOError(String),
    LaunchdError(String),
    ParseIntError(String),
}

impl Serialize for Error {
    fn serialize<S: Serializer>(&self, serializer: S) -> std::result::Result<S::Ok, S::Error>
    where
        S: serde::Serializer,
    {
        let mut s = serializer.serialize_struct("Error", 2)?;
        s.serialize_field("variant", &self.variant())?;
        s.serialize_field("message", &format!("{}", self))?;
        s.end()
    }
}
impl Display for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(
            f,
            "{}: {}",
            self.variant(),
            match self {
                Self::IOError(e) => e.to_string()
                Self::LaunchdError(e) => e.to_string()
                Self::ParseIntError(e) => e.to_string()
            }
        )
    }
}

impl Error {
    pub fn variant(&self) -> String {
        match self {
            Error::IOError(_) => "IOError",
            Error::LaunchdError(_) => "LaunchdError",
            Error::ParseIntError(_) => "ParseIntError",
        }
        .to_string()
    }
}

impl std::error::Error for Error {}
impl From<std::io::Error> for Error {
    fn from(e: std::io::Error) -> Self {
        Error::IOError(format!("{}", e))
    }
}
impl From<std::num::ParseIntError> for Error {
    fn from(e: std::num::ParseIntError) -> Self {
        Error::ParseIntError(format!("{}", e))
    }
}
pub type Result<T> = std::result::Result<T, Error>;
