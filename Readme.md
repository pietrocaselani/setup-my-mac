# Setup my macOS

[Ansible](https://docs.ansible.com/ansible/latest/index.html) roles to setup my macOS and development environment

# Instructions

First, make sure you have `pip` installed. To install `pip` use the following command:

* `sudo easy_install pip`

Then install Ansible:

* `pip install ansible`

Now you can just use `./run.sh -n "Your Name" -e your@email.com -c "Your Computer Name"` to execute Ansible.
Remember to input your password when asked.

# Which applications will be installed??

* Alfred
* Caffeine
* Enpass
* Firefox
* iTerm2
* Jetbrains Toolbox
* Karabiner-Elements
* Postman
* Slack
* Spotify
* Spectacle
* Telegram
* VSCode

# Which command line tools will be installed??

* docker
* hub
* jq
* oh-my-zsh

Also, some functions, aliases and git configurations will be added as well.

* [.bash_profile](https://github.com/pietrocaselani/setup-my-mac/blob/master/roles/bash-profile/files/bash_profile.sh)
* [macOS](https://github.com/pietrocaselani/setup-my-mac/blob/master/roles/osx-defaults/files/macos_defaults.sh) defaults values changed

Some settings will only be applied after logging out.

> "Why program by hand in five days what you can spend five years of your life automating?"
> — Dr Terence Parr
