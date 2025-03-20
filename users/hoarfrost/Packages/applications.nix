{ pkgs, inputs, system }:

with pkgs; [
  hyperion-ng            # wanted to do light-sync with the LED strip I installed, but this is very laggy. BETTER OPTION use Ambibox through wine
  nitrogen               # why did they call it that idgi
  telegram-desktop       # Telegram
  networkmanagerapplet   # Its an applet for when I need to manage(r) my network
  thunderbird            # Thunderbird in a scratchpad >>>>
  qbittorrent            # cubit or rent
  vlc                    # its a media player that is a client for playing video(LAN)
  zapzap                 # whatsapp
  sublime4               # p good
  parcellite             # clipboard
  kicad                  # i will make my own keyboard very soon
  teams-for-linux        # my hands are tied
  gimp                   # free nerfed photoshop
  element-web            # thunderbird matrix client is unfortunately ass as of now
  osu-lazer-bin          # very addicting
  polychromatic          # razer mouse
  zoom-us                # my hands are tied yet again
  arandr                 # very cool
  lmms                   # large manguage models
  inputs.zen-browser.packages."${system}".default # picture mad men final scene
  sxiv                   # simple image viewer (X) 
  zulip
  protonvpn-gui
]
