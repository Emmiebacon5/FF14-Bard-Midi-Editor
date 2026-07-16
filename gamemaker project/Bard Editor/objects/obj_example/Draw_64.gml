application_surface_enable(false);
display_set_gui_size(window_get_width(), window_get_height());
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_example);
draw_text(window_get_width() / 2, window_get_height() / 2, "Left-Click to Open a Dialog Box!")