if (alarm[0] > 0) exit;

// Show OK-Only Message Box
if (nDialogId == 0) { nDialogResult = ShowMessage("This is a dialog box. Click OK to continue."); alarm[0] = 10; }

// Show Yes/No Question Box
if (nDialogId == 1) { nDialogResult = ShowQuestion("Here is a question box. Yes or no?"); alarm[0] = 10; }

// Show Yes/No/Cancel Question Box
if (nDialogId == 2) { nDialogResult = ShowQuestionExt("Here is yet another question box. Yes, no, or cancel?"); alarm[0] = 10; }

// Set Filter For File Dialogs
if (nDialogId == 3) lpFilter = "Supported Image Files (*.png *.gif *.jpg *.jpeg)|*.png;*.gif;*.jpg;*.jpeg|PNG Image Files (*.png)|*.png|GIF Image Files (*.gif)|*.gif|JPEG Image Files (*.jpg *.jpeg)|*.jpg;*.jpeg";

// Select One Existing File and Echo the Result On-Open-Button
if (nDialogId == 3) { lpDialogResult = GetOpenFileName(lpFilter, @'Select a file', "", @'Open File'); alarm[0] = 10; }

// Select One (or More) Existing File(s) and Echo the Result On-Open-Button
if (nDialogId == 4) { lpDialogResult = GetOpenFileNames(lpFilter, @'Select one or more files', "", @'Open Files'); alarm[0] = 10; }

// Select One New (or Existing) File and Echo the Result On-Save-Button
if (nDialogId == 5) { lpDialogResult = GetSaveFileName(lpFilter, @'Untitled.png', "", @'Save As'); alarm[0] = 10; }

// Select One Existing Directory and Echo the Result On-Open-Button
if (nDialogId == 6) { lpDialogResult = GetDirectory("Select Directory", ""); alarm[0] = 10; }

// Force GetString/Number calls to have a Cancel Button
if (nDialogId == 7) environment_set_variable("IMGUI_DIALOG_CANCELABLE", string(true));

// Force GetString/Number calls to not have Password Input
if (nDialogId == 7) environment_set_variable("IMGUI_DIALOG_PASSWORD", string(false));

// Enter a String in the TextBox and Echo the Result if the Result is Not Empty
if (nDialogId == 7) { lpDialogResult = GetString("Enter a string in the input box below:", "ENTER TEXT HERE"); alarm[0] = 10; }

// Enter a Number in the TextBox and Echo the Result
if (nDialogId == 8) { nDialogResult = GetNumber("Enter a number in the input box below:", 404); alarm[0] = 10; }

// Force GetString/Number calls to have Password Input
if (nDialogId == 9) environment_set_variable("IMGUI_DIALOG_PASSWORD", string(true));

// Enter a String in the TextBox and Echo the Result if the Result is Not Empty
if (nDialogId == 9) { lpDialogResult = GetString("Enter a string in the password box below:", "ENTER TEXT HERE"); alarm[0] = 10; }

// Enter a Number in the TextBox and Echo the Result
if (nDialogId == 10) { nDialogResult = GetNumber("Enter a number in the password box below:", 404); alarm[0] = 10; }