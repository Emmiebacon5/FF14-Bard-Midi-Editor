/// @description Insert description here
// You can write your code in this editor
application_surface_enable(false);

// set the dnd destination window to game window...
// pointer_null is the default for no window at all
file_dnd_set_hwnd(hwnd_main);

// enable file and/or folder drag and drop...
file_dnd_set_enabled(true);

// init dnd file list as empty...
file_dnd_filelist = "";

// allow dnd of format pattern...
// file_dnd_pattern = "*.png;*.jpg;*.jpeg;*.gif"; // image files
// file_dnd_pattern = "*.app;*.plugin;*.bundle";  // bundle dirs
file_dnd_pattern = "*.mid"; // midi files only

// allow dnd of regular files?
file_dnd_allowfiles = true;

// allow dnd of directories?
file_dnd_allowdirs = false;

// allow dnd of multiple items?
file_dnd_allowmulti = false;