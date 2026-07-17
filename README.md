# FF14 Bard Midi Editor
A midi editor with features designed specifically with Final Fantasy 14's bards in mind

**This program is in early beta and should not be used as a replacement YET. I am a solo dev on this passion project, and while i have commitment issues with projects I do intend to see this through, it is just a lot of work and features.**
#

Someone I know, myself included, was getting very tired with the program "midieditor" because it kept crashing,it was slow, and was missing several essential features.
So, after lots of failed experiments with trying to find a suitable alternative, with every app having some major flaw or another, I said "fine, i'll do it myself" and created this!

Created with C++ and GamemakerStudio 2 (A program with no midi implementation whatsoever (Im very proud of this)), this midi editor plans to be *THE* replacement bards all across Eorzea have been begging for.

## Planned features:
- Normal midi functionality, stripped down to only include things that are recognised by FF14: No velocity, effects, program changes (barring guitars), and similar.

- Error checking to make sure your midi file will work well in-game: Checking for overlapping notes, 3 or more being played at the same time, making sure notes are in range of being playable by the game, checking instruments exist in game, among other things.

- Weaving simulation: When you try to play 2 or more notes at the same time, but they have to be "strummed" to work in FF14, this program will have an option to simulate that in a non-destructive way.

- Hopefully, be able to play midi files in the **FF14 SOUNDFONT** (or if not, guide the user in being able to do so, as the solution may not be within the program itself)

## This program was made using these external libraries, and would not be possible without them:
- GMSSimpleMIDI: https://github.com/RhyminGarfunkle/GMSSimpleMIDI
- RTMidi: https://github.com/thestk/rtmidi
- Craigsapp's midifile: https://github.com/craigsapp/midifile


##### *Final Fantasy 14 is owned by Square Enix, and is not affiliated with this in any way shape or form. Any sounds and images taken from the game are used with permission from the FF14 fankit*
##### *This program does NOT play midi files in-game for you, it is purely a midi file editor and acts completely standalone from the game*
