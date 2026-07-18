

#include "MidiFile.h"
#include "Options.h"
#include <random>
#include <iostream>
#include <string>
#include <iomanip>

#define func extern "C" __declspec(dllexport)

using namespace std;
using namespace smf;

void decToHexa(int n, std::string* outputlocation)
{
    // char array to store hexadecimal number
    char hexaDeciNum[100];

    // Counter for hexadecimal number array
    int i = 0;
    while (n != 0) {
        // Temporary variable to store remainder
        int temp = 0;

        // Storing remainder in temp variable.
        temp = n % 16;

        // Check if temp < 10
        if (temp < 10) {
            hexaDeciNum[i] = temp + 48;
            i++;
        }
        else {
            hexaDeciNum[i] = temp + 55;
            i++;
        }

        n = n / 16;
    }

    // Printing hexadecimal number
    // array in reverse order
    for (int j = i - 1; j >= 0; j--)
        *outputlocation = *outputlocation + hexaDeciNum[j];
}

func double savemidi(int* buffer) {
    Options options;
    options.define("o|output-file=s:Testmidiyay.mid", "Output filename (stdout if none)");
    options.define("i|instrument=i:0", "General MIDI instrument number");
    options.define("x|hex=b", "Hex byte-code output");
    int bufferpos = 0;
    MidiFile midifile;
    int track = 0;
    int channel = 0;
    int instr = options.getInteger("instrument");
    midifile.addTimbre(track, 0, channel, instr);
    cout << buffer[bufferpos] << endl;
    midifile.addTempo(0, 0, buffer[bufferpos]);
    bufferpos++;
    midifile.setTPQ(buffer[bufferpos]);
    
    
    cout << bufferpos << endl;
    bufferpos++;
    
    cout << "starting loop" << endl;
    while (true) {
        cout << buffer[bufferpos] << endl;
        if (buffer[bufferpos] == -2) { midifile.addTracks(buffer[bufferpos + 1]); bufferpos += 2; continue; }
        if (buffer[bufferpos] == -1) { //code for noteon

            midifile.addNoteOn(buffer[bufferpos + 4], buffer[bufferpos + 1], buffer[bufferpos + 4], buffer[bufferpos + 2], 100);
            midifile.addNoteOff(buffer[bufferpos + 4], buffer[bufferpos + 1] + buffer[bufferpos + 3], buffer[bufferpos + 4], buffer[bufferpos + 2]);
            bufferpos += 5; //1 = tick, 2= key, 3 = endtick, 4 = channel
            cout << "added on and off" << endl;
            continue;
        }
        
        else if (buffer[bufferpos] == -22) { //code for tempochange
            midifile.addTempo(0, buffer[bufferpos + 1], buffer[bufferpos + 2]);
            bufferpos += 3;
            cout << "added tempo" << endl;
            continue;
        }
        if (buffer[bufferpos] == -21) { break; }
        bufferpos++;
    }
    //// Cross reference song length with original BME
    //float tps = midifile.getFileDurationInTicks() / midifile.getFileDurationInSeconds();
    //float originaltps = buffer[bufferpos + 1]; //where og tps is stored
    //midifile.setTPQ(round(originaltps / tps));

    cout << "finished loop, sorting" << endl;
    midifile.sortTracks();
    cout << "sorted" << endl;
    string filename = options.getString("output-file");
    cout << "creating file" << endl;
    midifile.write(filename);
    cout << "file made! returning" << endl;
    return 1;
}
func double createrandommidi() {
    Options options;
    options.define("n|note-count=i:10", "How many notes to randomly play");
    options.define("o|output-file=s:Testmidiyay.mid", "Output filename (stdout if none)");
    options.define("i|instrument=i:0", "General MIDI instrument number");
    options.define("x|hex=b", "Hex byte-code output");

    random_device rd;
    mt19937 mt(rd());
    uniform_int_distribution<int> starttime(0, 100);
    uniform_int_distribution<int> duration(1, 8);
    uniform_int_distribution<int> pitch(36, 84);
    uniform_int_distribution<int> velocity(40, 100);

    MidiFile midifile;
    int track = 0;
    int channel = 0;
    int instr = options.getInteger("instrument");
    midifile.addTimbre(track, 0, channel, instr);

    int tpq = midifile.getTPQ();
    int count = options.getInteger("note-count");
    for (int i = 0; i < count; i++) {
        int starttick = int(starttime(mt) / 4.0 * tpq);
        int key = pitch(mt);
        int endtick = starttick + int(duration(mt) / 4.0 * tpq);
        midifile.addNoteOn(track, starttick, channel, key, velocity(mt));
        midifile.addNoteOff(track, endtick, channel, key);
    }
    midifile.sortTracks();  // Need to sort tracks since added events are
    // appended to track in random tick order.
    string filename = options.getString("output-file");
    if (filename.empty()) {
        if (options.getBoolean("hex")) midifile.writeHex(cout);
        else cout << midifile;
    }
    else
        midifile.write(filename);

    return double(0);
}

func double loadmidifile(const char* filename, int* buffer) {
    Options options;
    MidiFile midifile;
    midifile.read(filename);
    //else midifile.read(options.getArg(1));
    //midifile.doTimeAnalysis();
    midifile.linkNotePairs();

    int tracks = midifile.getTrackCount();
    //cout << "TPQ: " << midifile.getTicksPerQuarterNote() << endl;
    int bufferpos = 0;
    buffer[bufferpos] = midifile.getTicksPerQuarterNote();
    bufferpos ++;
    buffer[bufferpos] = midifile.getFileDurationInTicks() / midifile.getFileDurationInSeconds();
    bufferpos++;

    
    cout << "Hello there!" << endl;
    if (tracks > 1) cout << "TRACKS: " << tracks << endl;
    cout << "found tracks" << endl;
    for (int track = 0; track < tracks; track++) {




        if (tracks > 1) cout << "\nTrack " << track << endl;
        //cout << "adding -20..." << endl;
        //cout << bufferpos << endl;
        //cout << buffer[bufferpos] << endl;
        buffer[bufferpos] = -20;
        bufferpos += 1;
        //cout << "added -20" << endl;
        //cout << "Tick\tSeconds\tDur\tMessage" << endl;
        for (int event = 0; event < midifile[track].size(); event++) {



            //cout << dec << midifile[track][event].tick;

            //cout << "adding tick data..." << endl;
            buffer[bufferpos] = midifile[track][event].tick;
            bufferpos += 1;
            //cout << "added tick data" << endl;

            //cout << '\t' << dec << midifile[track][event].seconds;
            //dont need seconds information in gms2

            //cout << '\t';
            if (midifile[track][event].isTempo()) {
                cout << "found tempo change" << endl;
                int value = 0;
                std::string hexvalue;
                decToHexa(midifile[track][event][3], &hexvalue);
                decToHexa(midifile[track][event][4], &hexvalue);
                decToHexa(midifile[track][event][5], &hexvalue);

                value = std::stoi(hexvalue, nullptr, 16);

                buffer[bufferpos] = -22;
                bufferpos++;
                buffer[bufferpos] = value;
                bufferpos++;
                continue;
            }
            if (midifile[track][event].isNoteOn()) {
                //cout << "adding noteon" << endl;
                buffer[bufferpos] = -1; //my code for noteon
                bufferpos += 1;
                //cout << "added noteon" << endl;

                //cout << "adding duration" << endl;
                //cout << midifile[track][event].getDurationInSeconds();
                buffer[bufferpos] = midifile[track][event].getTickDuration();
                bufferpos += 1;
                //cout << "added duration" << endl;
            }
            //cout << '\t' << hex;
            buffer[bufferpos] = -3;
            bufferpos += 1;
            buffer[bufferpos] = midifile[track][event].size();
            bufferpos += 1;

            //cout << "adding hex" << endl;
            for (int i = 0; i < midifile[track][event].size(); i++) {
                //cout << (int)midifile[track][event][i] << ' ';
                buffer[bufferpos] = (int)midifile[track][event][i];
                bufferpos += 1;
            }
            //cout << "added hex" << endl;
            //cout << endl;
        }
    }
    //buffer format
    // tick, note code, duration, messagesize, [hex1], [hex2], [hex3]
    // codes:
    // code -1 = noteon
    // code -2 = channelchange
    // code -3 = next value is size
    // code -20 = newtrack (start at -1, straight into 0)
    // code -21 = eof
    // code -22 = tempochange
    // code -23 = program change (instrument)
    bufferpos++;
    buffer[bufferpos] = -21;
    bufferpos++;
    return 1; //success
}


