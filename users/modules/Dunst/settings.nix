{ ... }:
{
  global = {
    alignment = "left";
    always_run_script = true;

    font = "JetBrainsMono Nerd Font Mono 10";

    indicate_hidden = "yes";

    mouse_left_click = "do_action, close_current";
    mouse_middle_click = "do_action, close_current";
    mouse_right_click = "close_all";

    corner_radius = 6;
    frame_width = 1;
    horizontal_padding = 14;
    padding = 8;
    separator_height = 2;

    show_indicators = "yes";
    sticky_history = "no";
    vertical_alignment = "center";
    word_wrap = "yes";
  };

  urgency_low = {
    frame_color = "#f4dbd6";
    timeout = 5;
  };

  urgency_normal = {
    frame_color = "#B5ACF5";
    timeout = 10;
  };

  urgency_critical = {
    frame_color = "#ed8796";
    timeout = 20;
  };
}