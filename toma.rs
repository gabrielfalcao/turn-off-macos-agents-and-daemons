use clap::Parser;
use iocore::User;
use toma::{turn_off, Error, Uid};

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = "turn off macos agents and daemons")]
pub struct Cli {
    #[arg(short, long, default_value = "501")]
    uid: Option<Uid>,

    #[arg(short = 's', long)]
    user_services: Vec<String>,

    #[arg(short = 'S', long)]
    system_services: Vec<String>,

    #[arg(short, long)]
    verbose: bool,
}

impl Cli {
    pub fn turn_off(&self) -> (Vec<String>, Vec<(String, Error)>) {
        turn_off(
            self.uid.clone(),
            !self.verbose,
            self.user_services.clone(),
            self.system_services.clone(),
        )
    }
}
fn main() {
    let user = User::id().unwrap();
    if user.name() != "root" && user.uid() != 0 {
        panic!("must run as root");
    }
    let args = Cli::parse();
    let (success, errors) = args.turn_off();
    if success.len() > 0 {
        println!("{} agents or daemons turned off:\n{}", success.len(), success.join("\n"));
    }
    if errors.len() > 0 {
        println!(
            "{} agents or daemons might be already turned off:\n{}",
            errors.len(),
            errors.iter().map(|(n, _)| n.to_string()).collect::<Vec<String>>().join("\n")
        );
    }
}
