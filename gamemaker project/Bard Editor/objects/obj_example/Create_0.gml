// Ubuntu export needs packages installed to work
// Run the following terminal command to install:
// sudo apt update && sudo apt install libgtk-3-dev libglib2.0-dev

// Remember the Good Old Days of GameMaker 8.1 and before?
// Remember the super customizable Mark Overmars PopUpBox?
// Well, they're back, and potentially better than ever...

// All Parts of the Dialogs have Editable Text
// Not only useful to change the wording of it
// Also good for creating your own translation 
// American English is the Language by Default
// There are Two Other Language Localizations:
DialogSetLocaleToAmericanEnglish();
//DialogSetLocaleToSimplifiedChinese();
//DialogSetLocaleToBrazilianPortuguese();

// Set Window Size for Dialogs:
DialogSetWindowSize(720, 394);

// Set Title Bar Caption of Non-File-or-Directory-Selection Dialogs:
environment_set_variable("IMGUI_DIALOG_CAPTION", window_get_caption());

// Embed All Dialogs in Main Game Window (Windows-Only):
environment_set_variable("IMGUI_DIALOG_EMBEDDED", string(true));

// Do Not Display Any Dialogs in Borderless Mode (Default Behavior):
environment_set_variable("IMGUI_DIALOG_NOBORDER", string(false));

// Do Not Display Any Dialog as a Fullscreen Window (Default Behavior):
environment_set_variable("IMGUI_DIALOG_FULLSCREEN", string(false));

// Select a Custom Theme for All Dialogs: 
// Classic=-1, Dark=0, Light=1, Custom=2
// Example themes -1 to 1 are from ImGui
environment_set_variable("IMGUI_DIALOG_THEME", string(2));

// Set the Custom Color Theme:
// Color Scheme (R,G,B=0,1,2) 
environment_set_variable("IMGUI_TEXT_COLOR_0", string(1));
environment_set_variable("IMGUI_TEXT_COLOR_1", string(1));
environment_set_variable("IMGUI_TEXT_COLOR_2", string(1));
environment_set_variable("IMGUI_HEAD_COLOR_0", string(0.35));
environment_set_variable("IMGUI_HEAD_COLOR_1", string(0.55));
environment_set_variable("IMGUI_HEAD_COLOR_2", string(0.55));
environment_set_variable("IMGUI_AREA_COLOR_0", string(0.18));
environment_set_variable("IMGUI_AREA_COLOR_1", string(0.18));
environment_set_variable("IMGUI_AREA_COLOR_2", string(0.18));
environment_set_variable("IMGUI_BODY_COLOR_0", string(1));
environment_set_variable("IMGUI_BODY_COLOR_1", string(1));
environment_set_variable("IMGUI_BODY_COLOR_2", string(1));
environment_set_variable("IMGUI_POPS_COLOR_0", string(0.07));
environment_set_variable("IMGUI_POPS_COLOR_1", string(0.07));
environment_set_variable("IMGUI_POPS_COLOR_2", string(0.07));

// Desired Font Size:
DialogSetFontSize(20);

// Set Folder to Load All Fonts (Not Recursive):
DialogSetFontFolder(working_directory + "fonts");

// You also may set the Font by Combining a List of Files based on a Line-Feed "\n" Separated String
// Absolute Paths for Every File in the List of ttf and otf files you choose are Recommended for Use
#region fonts
/*
environment_set_variable("IMGUI_FONT_FILES", 
working_directory + string_lower("fonts/000-Roboto-Medium.ttf\n") +
working_directory + string_lower("fonts/001-NotoKufiArabic-Regular.ttf\n") +
working_directory + string_lower("fonts/002-NotoMusic-Regular.ttf\n") +
working_directory + string_lower("fonts/003-NotoNaskhArabic-Regular.ttf\n") +
working_directory + string_lower("fonts/004-NotoNaskhArabicUI-Regular.ttf\n") +
working_directory + string_lower("fonts/005-NotoNastaliqUrdu-Regular.ttf\n") +
working_directory + string_lower("fonts/006-NotoSansAdlam-Regular.ttf\n") +
working_directory + string_lower("fonts/007-NotoSansAdlamUnjoined-Regular.ttf\n") +
working_directory + string_lower("fonts/008-NotoSansAnatolianHieroglyphs-Regular.ttf\n") +
working_directory + string_lower("fonts/009-NotoSansArabic-Regular.ttf\n") +
working_directory + string_lower("fonts/010-NotoSansArabicUI-Regular.ttf\n") +
working_directory + string_lower("fonts/011-NotoSansArmenian-Regular.ttf\n") +
working_directory + string_lower("fonts/012-NotoSansAvestan-Regular.ttf\n") +
working_directory + string_lower("fonts/013-NotoSansBamum-Regular.ttf\n") +
working_directory + string_lower("fonts/014-NotoSansBassaVah-Regular.ttf\n") +
working_directory + string_lower("fonts/015-NotoSansBatak-Regular.ttf\n") +
working_directory + string_lower("fonts/016-NotoSansBengali-Regular.ttf\n") +
working_directory + string_lower("fonts/017-NotoSansBengaliUI-Regular.ttf\n") +
working_directory + string_lower("fonts/018-NotoSansBhaiksuki-Regular.ttf\n") +
working_directory + string_lower("fonts/019-NotoSansBrahmi-Regular.ttf\n") +
working_directory + string_lower("fonts/020-NotoSansBuginese-Regular.ttf\n") +
working_directory + string_lower("fonts/021-NotoSansBuhid-Regular.ttf\n") +
working_directory + string_lower("fonts/022-NotoSansCanadianAboriginal-Regular.ttf\n") +
working_directory + string_lower("fonts/023-NotoSansCarian-Regular.ttf\n") +
working_directory + string_lower("fonts/024-NotoSansCaucasianAlbanian-Regular.ttf\n") +
working_directory + string_lower("fonts/025-NotoSansChakma-Regular.ttf\n") +
working_directory + string_lower("fonts/026-NotoSansCham-Regular.ttf\n") +
working_directory + string_lower("fonts/027-NotoSansCherokee-Regular.ttf\n") +
working_directory + string_lower("fonts/028-NotoSansCoptic-Regular.ttf\n") +
working_directory + string_lower("fonts/029-NotoSansCuneiform-Regular.ttf\n") +
working_directory + string_lower("fonts/030-NotoSansCypriot-Regular.ttf\n") +
working_directory + string_lower("fonts/031-NotoSansDeseret-Regular.ttf\n") +
working_directory + string_lower("fonts/032-NotoSansDevanagari-Regular.ttf\n") +
working_directory + string_lower("fonts/033-NotoSansDevanagariUI-Regular.ttf\n") +
working_directory + string_lower("fonts/034-NotoSansDisplay-Regular.ttf\n") +
working_directory + string_lower("fonts/035-NotoSansDuployan-Regular.ttf\n") +
working_directory + string_lower("fonts/036-NotoSansEgyptianHieroglyphs-Regular.ttf\n") +
working_directory + string_lower("fonts/037-NotoSansElbasan-Regular.ttf\n") +
working_directory + string_lower("fonts/038-NotoSansEthiopic-Regular.ttf\n") +
working_directory + string_lower("fonts/039-NotoSansGeorgian-Regular.ttf\n") +
working_directory + string_lower("fonts/040-NotoSansGlagolitic-Regular.ttf\n") +
working_directory + string_lower("fonts/041-NotoSansGothic-Regular.ttf\n") +
working_directory + string_lower("fonts/042-NotoSansGrantha-Regular.ttf\n") +
working_directory + string_lower("fonts/043-NotoSansGujarati-Regular.ttf\n") +
working_directory + string_lower("fonts/044-NotoSansGujaratiUI-Regular.ttf\n") +
working_directory + string_lower("fonts/045-NotoSansGurmukhi-Regular.ttf\n") +
working_directory + string_lower("fonts/046-NotoSansGurmukhiUI-Regular.ttf\n") +
working_directory + string_lower("fonts/047-NotoSansHanifiRohingya-Regular.ttf\n") +
working_directory + string_lower("fonts/048-NotoSansHanunoo-Regular.ttf\n") +
working_directory + string_lower("fonts/049-NotoSansHatran-Regular.ttf\n") +
working_directory + string_lower("fonts/050-NotoSansHebrew-Regular.ttf\n") +
working_directory + string_lower("fonts/051-NotoSansImperialAramaic-Regular.ttf\n") +
working_directory + string_lower("fonts/052-NotoSansIndicSiyaqNumbers-Regular.ttf\n") +
working_directory + string_lower("fonts/053-NotoSansInscriptionalPahlavi-Regular.ttf\n") +
working_directory + string_lower("fonts/054-NotoSansInscriptionalParthian-Regular.ttf\n") +
working_directory + string_lower("fonts/055-NotoSansJavanese-Regular.ttf\n") +
working_directory + string_lower("fonts/056-NotoSansKaithi-Regular.ttf\n") +
working_directory + string_lower("fonts/057-NotoSansKannada-Regular.ttf\n") +
working_directory + string_lower("fonts/058-NotoSansKannadaUI-Regular.ttf\n") +
working_directory + string_lower("fonts/059-NotoSansKayahLi-Regular.ttf\n") +
working_directory + string_lower("fonts/060-NotoSansKharoshthi-Regular.ttf\n") +
working_directory + string_lower("fonts/061-NotoSansKhmer-Regular.ttf\n") +
working_directory + string_lower("fonts/062-NotoSansKhmerUI-Regular.ttf\n") +
working_directory + string_lower("fonts/063-NotoSansKhojki-Regular.ttf\n") +
working_directory + string_lower("fonts/064-NotoSansKhudawadi-Regular.ttf\n") +
working_directory + string_lower("fonts/065-NotoSansLao-Regular.ttf\n") +
working_directory + string_lower("fonts/066-NotoSansLaoUI-Regular.ttf\n") +
working_directory + string_lower("fonts/067-NotoSansLepcha-Regular.ttf\n") +
working_directory + string_lower("fonts/068-NotoSansLimbu-Regular.ttf\n") +
working_directory + string_lower("fonts/069-NotoSansLinearA-Regular.ttf\n") +
working_directory + string_lower("fonts/070-NotoSansLinearB-Regular.ttf\n") +
working_directory + string_lower("fonts/071-NotoSansLisu-Regular.ttf\n") +
working_directory + string_lower("fonts/072-NotoSansLycian-Regular.ttf\n") +
working_directory + string_lower("fonts/073-NotoSansLydian-Regular.ttf\n") +
working_directory + string_lower("fonts/074-NotoSansMahajani-Regular.ttf\n") +
working_directory + string_lower("fonts/075-NotoSansMalayalam-Regular.ttf\n") +
working_directory + string_lower("fonts/076-NotoSansMalayalamUI-Regular.ttf\n") +
working_directory + string_lower("fonts/077-NotoSansMandaic-Regular.ttf\n") +
working_directory + string_lower("fonts/078-NotoSansManichaean-Regular.ttf\n") +
working_directory + string_lower("fonts/079-NotoSansMarchen-Regular.ttf\n") +
working_directory + string_lower("fonts/080-NotoSansMath-Regular.ttf\n") +
working_directory + string_lower("fonts/081-NotoSansMayanNumerals-Regular.ttf\n") +
working_directory + string_lower("fonts/082-NotoSansMeeteiMayek-Regular.ttf\n") +
working_directory + string_lower("fonts/083-NotoSansMendeKikakui-Regular.ttf\n") +
working_directory + string_lower("fonts/084-NotoSansMeroitic-Regular.ttf\n") +
working_directory + string_lower("fonts/085-NotoSansMiao-Regular.ttf\n") +
working_directory + string_lower("fonts/086-NotoSansModi-Regular.ttf\n") +
working_directory + string_lower("fonts/087-NotoSansMongolian-Regular.ttf\n") +
working_directory + string_lower("fonts/088-NotoSansMono-Regular.ttf\n") +
working_directory + string_lower("fonts/089-NotoSansMro-Regular.ttf\n") +
working_directory + string_lower("fonts/090-NotoSansMultani-Regular.ttf\n") +
working_directory + string_lower("fonts/091-NotoSansMyanmar-Regular.ttf\n") +
working_directory + string_lower("fonts/092-NotoSansMyanmarUI-Regular.ttf\n") +
working_directory + string_lower("fonts/093-NotoSansNabataean-Regular.ttf\n") +
working_directory + string_lower("fonts/094-NotoSansNewa-Regular.ttf\n") +
working_directory + string_lower("fonts/095-NotoSansNewTaiLue-Regular.ttf\n") +
working_directory + string_lower("fonts/096-NotoSansNKo-Regular.ttf\n") +
working_directory + string_lower("fonts/097-NotoSansOgham-Regular.ttf\n") +
working_directory + string_lower("fonts/098-NotoSansOlChiki-Regular.ttf\n") +
working_directory + string_lower("fonts/099-NotoSansOldHungarian-Regular.ttf\n") +
working_directory + string_lower("fonts/100-NotoSansOldItalic-Regular.ttf\n") +
working_directory + string_lower("fonts/101-NotoSansOldNorthArabian-Regular.ttf\n") +
working_directory + string_lower("fonts/102-NotoSansOldPermic-Regular.ttf\n") +
working_directory + string_lower("fonts/103-NotoSansOldPersian-Regular.ttf\n") +
working_directory + string_lower("fonts/104-NotoSansOldSogdian-Regular.ttf\n") +
working_directory + string_lower("fonts/105-NotoSansOldSouthArabian-Regular.ttf\n") +
working_directory + string_lower("fonts/106-NotoSansOldTurkic-Regular.ttf\n") +
working_directory + string_lower("fonts/107-NotoSansOriya-Regular.ttf\n") +
working_directory + string_lower("fonts/108-NotoSansOriyaUI-Regular.ttf\n") +
working_directory + string_lower("fonts/109-NotoSansOsage-Regular.ttf\n") +
working_directory + string_lower("fonts/110-NotoSansOsmanya-Regular.ttf\n") +
working_directory + string_lower("fonts/111-NotoSansPahawhHmong-Regular.ttf\n") +
working_directory + string_lower("fonts/112-NotoSansPalmyrene-Regular.ttf\n") +
working_directory + string_lower("fonts/113-NotoSansPauCinHau-Regular.ttf\n") +
working_directory + string_lower("fonts/114-NotoSansPhagsPa-Regular.ttf\n") +
working_directory + string_lower("fonts/115-NotoSansPhoenician-Regular.ttf\n") +
working_directory + string_lower("fonts/116-NotoSansPsalterPahlavi-Regular.ttf\n") +
working_directory + string_lower("fonts/117-NotoSansRejang-Regular.ttf\n") +
working_directory + string_lower("fonts/118-NotoSansRunic-Regular.ttf\n") +
working_directory + string_lower("fonts/119-NotoSansSamaritan-Regular.ttf\n") +
working_directory + string_lower("fonts/120-NotoSansSaurashtra-Regular.ttf\n") +
working_directory + string_lower("fonts/121-NotoSansSharada-Regular.ttf\n") +
working_directory + string_lower("fonts/122-NotoSansShavian-Regular.ttf\n") +
working_directory + string_lower("fonts/123-NotoSansSiddham-Regular.ttf\n") +
working_directory + string_lower("fonts/124-NotoSansSinhala-Regular.ttf\n") +
working_directory + string_lower("fonts/125-NotoSansSinhalaUI-Regular.ttf\n") +
working_directory + string_lower("fonts/126-NotoSansSoraSompeng-Regular.ttf\n") +
working_directory + string_lower("fonts/127-NotoSansSundanese-Regular.ttf\n") +
working_directory + string_lower("fonts/128-NotoSansSylotiNagri-Regular.ttf\n") +
working_directory + string_lower("fonts/129-NotoSansSymbols2-Regular.ttf\n") +
working_directory + string_lower("fonts/130-NotoSansSymbols-Regular.ttf\n") +
working_directory + string_lower("fonts/131-NotoSansSyriac-Regular.ttf\n") +
working_directory + string_lower("fonts/132-NotoSansTagalog-Regular.ttf\n") +
working_directory + string_lower("fonts/133-NotoSansTagbanwa-Regular.ttf\n") +
working_directory + string_lower("fonts/134-NotoSansTaiLe-Regular.ttf\n") +
working_directory + string_lower("fonts/135-NotoSansTaiTham-Regular.ttf\n") +
working_directory + string_lower("fonts/136-NotoSansTaiViet-Regular.ttf\n") +
working_directory + string_lower("fonts/137-NotoSansTakri-Regular.ttf\n") +
working_directory + string_lower("fonts/138-NotoSansTamil-Regular.ttf\n") +
working_directory + string_lower("fonts/139-NotoSansTamilSupplement-Regular.ttf\n") +
working_directory + string_lower("fonts/140-NotoSansTamilUI-Regular.ttf\n") +
working_directory + string_lower("fonts/141-NotoSansTelugu-Regular.ttf\n") +
working_directory + string_lower("fonts/142-NotoSansTeluguUI-Regular.ttf\n") +
working_directory + string_lower("fonts/143-NotoSansThaana-Regular.ttf\n") +
working_directory + string_lower("fonts/144-NotoSansThai-Regular.ttf\n") +
working_directory + string_lower("fonts/145-NotoSansThaiUI-Regular.ttf\n") +
working_directory + string_lower("fonts/146-NotoSansTibetan-Regular.ttf\n") +
working_directory + string_lower("fonts/147-NotoSansTifinagh-Regular.ttf\n") +
working_directory + string_lower("fonts/148-NotoSansTirhuta-Regular.ttf\n") +
working_directory + string_lower("fonts/149-NotoSansUgaritic-Regular.ttf\n") +
working_directory + string_lower("fonts/150-NotoSansVai-Regular.ttf\n") +
working_directory + string_lower("fonts/151-NotoSansWarangCiti-Regular.ttf\n") +
working_directory + string_lower("fonts/152-NotoSansYi-Regular.ttf\n") +
working_directory + string_lower("fonts/153-NotoSansTC-Regular.otf\n") +
working_directory + string_lower("fonts/154-NotoSansJP-Regular.otf\n") +
working_directory + string_lower("fonts/155-NotoSansKR-Regular.otf\n") +
working_directory + string_lower("fonts/156-NotoSansSC-Regular.otf\n") +
working_directory + string_lower("fonts/157-NotoSansHK-Regular.otf"));
*/
#endregion

nDialogId = 0;
