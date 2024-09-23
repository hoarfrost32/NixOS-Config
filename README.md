# NixOS Configuration

Took inspiration from quite a few configurations, but especially the two below:

* [Matthias Benaets' Config](https://github.com/MatthiasBenaets/nix-config)
* [Mitchellh's Config](https://github.com/mitchellh/nixos-config)

Pictures of my system are on my [Qtile config's](https://github.com/hoarfrost32/qtile_config) repository

The organisation of my config is mostly in two folders: *Hosts* & *Users* 

### Hosts Directory
* This directory holds the configurations for the various host machines I may use. I only use one though (yeah nix isnt ideal for just managing one system (but its fun))
* `common.nix` holds configuration options I want enabled for all hosts, and then system specific configs are in their respective folders.
* The modules folder holds system-level modules. Currently all I have their are the desktop options I may want (kde6 and qtile). To enable either kde or qtile just import them into the config, and type `qtile.enable = true;` or `kde.enable = true;` 

###  Users Directory
* This directory holds the configurations for the various users I want to manage. There is only one user for now (again yeah nix isnt ideal for one user. see above on why im using it)
* the home-manager config of each user is in a directory of the same name as the user. many other user level modules are imported from within the user directory, the idea being that in the case of multiple users they can each import the modules they require as per their needs
* Generally pretty much all user level modules are configured with options exposed in nix, with a few exceptions (like ranger).

### Catppuccin
* Pretty much everything I could theme using catppuccin I have. Its incredibly easy to work with catppuccin if your config is set up as a flake (see [here](https://nix.catppuccin.com/))
* Most of the modules in the users/modules directory are modules specifically because I wanted to access the catppuccin options

### File Structure

```
.
├── flake.lock                                            
├── flake.nix
├── hosts                                                     # The device configurations are stored here
│   ├── common.nix                                            # Common configurations for all devices
│   ├── default.nix
│   ├── machines
│   │   └── nixOS                                             # My config for using nixos on my laptop. 
│   │       ├── configuration.nix
│   │       └── hardware-configuration.nix
│   └── modules                                               # Modules for the devices. 
│       └── desktops                                          # Desktop modules.
│           ├── default.nix
│           ├── kde                                           # KDE 6
│           │   └── kde.nix
│           ├── qtile                                         # Qtile
│           │   └── qtile.nix
│           └── xorg
│               └── default.nix
├── README.md
└── users                                                     # User configurations are stored here
    ├── hoarfrost                                             # This is me. 
    │   └── home.nix
    │   └── Packages
    │       ├── applications.nix
    │       ├── cli-utilities.nix
    │       ├── default.nix
    │       ├── programming.nix
    │       └── tui.nix                                       
    └── modules                                               # Modules for the users
        ├── Alacritty                                         # Alacritty
        │   └── alacritty.nix
        ├── bat
        │   └── bat.nix
        ├── btop
        │   └── btop.nix
        ├── default.nix
        ├── Dunst                                             # Dunst
        │   └── dunst.nix
        ├── Editors
        │   ├── Emacs
        │   │   └── emacs.nix
        │   └── Sublime
        │       └── sublime.nix
        ├── Fish                                              # Fish
        │   └── fish.nix
        ├── GTK                                               # GTK
        │   └── gtk.nix
        ├── mpv
        │   └── mpv.nix
        ├── Picom                                             # Picom
        │   └── picom.nix
        ├── Ranger                                            # Ranger
        │   └── ranger.nix
        └── Rofi                                              # Rofi
        │   └── rofi.nix
        ├── Sioyek
        │   ├── config
        │   │   └── sioyek.config
        │   └── sioyek.nix
        └── tmux
            └── tmux.nix
```
