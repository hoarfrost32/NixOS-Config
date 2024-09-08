# NixOS Configuration

Took inspiration from quite a few configurations, but especially the two below:

* [Matthias Benaets' Config](https://github.com/MatthiasBenaets/nix-config)
* [Mitchellh's Config](https://github.com/mitchellh/nixos-config)


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
    └── modules                                               # Modules for the users
        ├── Alacritty                                         # Alacritty
        │   └── alacritty.nix
        ├── Dunst                                             # Dunst
        │   └── dunst.nix
        ├── Fish                                              # Fish
        │   └── fish.nix
        ├── GTK                                               # GTK
        │   └── gtk.nix
        ├── Picom                                             # Picom
        │   └── picom.nix
        ├── Ranger                                            # Ranger
        │   ├── config
        │   │   └── scope.sh
        │   └── ranger.nix
        └── Rofi                                              # Rofi
            └── rofi.nix
```
