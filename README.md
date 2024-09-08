# My NixOS Configuration


.
├── flake.lock                                            
├── flake.nix
├── hosts                                                     # The device configurations are stored here
│   ├── common.nix                                            # Common configurations for all devices
│   ├── default.nix
│   ├── machines
│   │   └── nixOS                                             # My config for using nixos on my laptop. 
│   │       ├── configuration.nix
│   │       └── hardware-configuration.nix
│   └── modules                                               # Modules for the devices. 
│       └── desktops                                          # Desktop modules.
│           ├── default.nix
│           ├── kde                                           # KDE 6
│           │   └── kde.nix
│           ├── qtile                                         # Qtile
│           │   └── qtile.nix
│           └── xorg
│               └── default.nix
├── README.md
└── users                                                     # User configurations are stored here
    ├── hoarfrost                                             # This is me. 
    │   └── home.nix                                          # My home-manager configuration
    └── modules                                               # Modules for the users
        ├── Alacritty                                         # Alacritty
        │   └── alacritty.nix
        ├── Fish                                              # Fish
        │   └── fish.nix
        ├── GTK                                               # GTK
        │   └── gtk.nix
        ├── Picom                                             # Picom
        │   └── picom.nix
        ├── Ranger                                            # Ranger
        │   ├── config
        │   │   └── scope.sh
        │   └── ranger.nix
        └── Rofi                                              # Rofi
            └── rofi.nix
