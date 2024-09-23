# NixOS Configuration

Took inspiration from quite a few configurations, but especially the two below:

* [Matthias Benaets' Config](https://github.com/MatthiasBenaets/nix-config)
* [Mitchellh's Config](https://github.com/mitchellh/nixos-config)

Pictures of my system are on my [Qtile config's](https://github.com/hoarfrost32/qtile_config) repository

The organisation of my config is mostly in two folders: *Hosts* & *Users*. I only have one machine and one user, but nixos is fun and if I ever end up having more of either then this structuring would probably help keep everything modular.

### Hosts Directory
* This directory holds the configurations for the various host machines I may use. I only use one though :p
* `common.nix` holds configuration options I want enabled for all hosts, and then system specific configs are in their respective folders.
* The modules folder holds system-level modules. Currently all I have their are the desktop options I may want (kde6 and qtile). To enable either kde or qtile just import them into the config, and type `qtile.enable = true;` or `kde.enable = true;` 

###  Users Directory
* This directory holds the configurations for the various users I want to manage. There is only one user for now :)
* the home-manager config of each user is in a directory of the same name as the user. many other user level modules are imported from within the user directory, the idea being that in the case of multiple users they can each import the modules they require as per their needs
* Generally pretty much all user level modules are configured with options exposed in nix, with a few exceptions (like ranger).

### Catppuccin
* Pretty much everything I could theme using catppuccin I have. Its incredibly easy to work with catppuccin if your config is set up as a flake (see [here](https://nix.catppuccin.com/))
* Most of the modules in the `users/modules` directory are modules specifically because I wanted to access the catppuccin options

### TODO (List will grow as I remember more stuff)
* Devshells
* Maybe a shell script for package install that uses `sed` to put the package name in the correct file and then also runs rebuild?
* Set up steam/wine/lutris

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
    │   └── Packages                                          # I split home.packages into multiple
    │       ├── applications.nix                              # files.
    │       ├── cli-utilities.nix
    │       ├── default.nix
    │       ├── programming.nix
    │       └── tui.nix                                       
    └── modules                                               # Modules for the users
        ├── Alacritty                                         # Alacritty
        │   └── alacritty.nix
        ├── bat                                               # A better cat
        │   └── bat.nix
        ├── btop                                              # A better htop
        │   └── btop.nix
        ├── default.nix                                       # imports
        ├── Dunst                                             # Dunst
        │   └── dunst.nix
        ├── Editors                                           # Text editors
        │   ├── Emacs
        │   │   └── emacs.nix
        │   └── Sublime    
        │       └── sublime.nix
        ├── Fish                                              # Fish
        │   └── fish.nix
        ├── GTK                                               # Everything GTK themed by catppucin 
        │   └── gtk.nix
        ├── mpv                                               # Video Player
        │   └── mpv.nix
        ├── Picom                                             # Compositor                                             
        │   └── picom.nix
        ├── Ranger                                            # File Manager
        │   └── ranger.nix
        └── Rofi                                              # Better dmenu
        │   └── rofi.nix
        ├── Sioyek                                            # Doc Viewer and better zathura
        │   ├── config
        │   │   └── sioyek.config
        │   └── sioyek.nix
        └── tmux                                              # Terminal multiplexer
            └── tmux.nix
```
