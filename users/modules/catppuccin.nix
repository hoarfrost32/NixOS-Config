{pkgs, ...}:

{
    catppuccin = {
        tmux = {
            enable = true;
            flavor = "mocha";
        };
        
        rofi = {
            enable = true;
            flavor = "macchiato";
        };

        mpv = {
            enable = true;
            flavor = "mocha";
            accent = "lavender";
        };

        gtk = {
            enable = true;
            icon.enable = true;
            flavor = "mocha";
            accent = "lavender";
            size = "standard";
            tweaks = [ "normal" ];
        };

        fish = {
            enable = true;
            flavor = "mocha";
        };

        dunst = {
            enable = true;
            flavor = "mocha";
        };

        btop = {
            enable = true;
            flavor = "mocha";
        };

        bat = {
            enable = true;
            flavor = "mocha";
        };

        alacritty.enable = true;
    }
}
