use iocore::shell_command_string_output;

use crate::{Error, Result, Uid};

pub fn turn_off_agent_or_daemon(ad: impl std::fmt::Display, uid: Option<Uid>) -> Result<()> {
    bootout_agent_or_daemon(&ad, uid.clone())?;
    disable_agent_or_daemon(&ad, uid)?;
    Ok(())
}

pub fn agent_or_daemon(ad: impl std::fmt::Display, uid: Option<Uid>) -> String {
    match uid {
        Some(uid) => format!("gui/{}/{}", uid, ad),
        None => format!("system/{}", ad),
    }
}
pub fn launchctl(
    subcommand: impl std::fmt::Display,
    ad: impl std::fmt::Display,
    uid: Option<Uid>,
) -> Result<i32> {
    let command = format!("launchctl {} {}", &subcommand, &agent_or_daemon(ad, uid));
    let (exit_code, _, err) = shell_command_string_output(&command, "/System")?;
    if exit_code != 0 {
        Err(Error::LaunchdError(format!(
            "`{}' failed with exit code {:#?}: {}",
            &command, exit_code, err
        )))
    } else {
        Ok(exit_code)
    }
}

pub fn bootout_agent_or_daemon(ad: impl std::fmt::Display, uid: Option<Uid>) -> Result<i32> {
    Ok(launchctl("bootout", ad, uid)?)
}
pub fn disable_agent_or_daemon(ad: impl std::fmt::Display, uid: Option<Uid>) -> Result<i32> {
    Ok(launchctl("disable", ad, uid)?)
}
