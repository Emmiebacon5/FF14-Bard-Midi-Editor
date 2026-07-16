// Echo Results in a Message Box
// Do Not Echo When Empty String

if (nDialogId == 0) { if (nDialogResult == 1) ShowMessage("OK"); }

if (nDialogId == 1) { if (nDialogResult == 0) ShowMessage("No");
if (nDialogResult == 1) ShowMessage("Yes"); }

if (nDialogId == 2) { if (nDialogResult == -1) ShowMessage("Cancel");
if (nDialogResult ==  0) ShowMessage("No");
if (nDialogResult ==  1) ShowMessage("Yes"); }

if (nDialogId == 3) { if (lpDialogResult != "") ShowMessage(lpDialogResult); }

if (nDialogId == 4) { if (lpDialogResult != "") ShowMessage(lpDialogResult); }

if (nDialogId == 5) { if (lpDialogResult != "") ShowMessage(lpDialogResult); }

if (nDialogId == 6) { if (lpDialogResult != "") ShowMessage(lpDialogResult); }

if (nDialogId == 7) { ShowMessage(lpDialogResult); }

if (nDialogId == 8) { ShowMessage(nDialogResult); }

if (nDialogId == 9) { ShowMessage(lpDialogResult); }

if (nDialogId == 10) { ShowMessage(nDialogResult); }

// Next Dialog
nDialogId++;

// End of Demo
if (nDialogId == 11) nDialogId = 0;