//
//  RelaxingMusicView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI
import AVFoundation

struct RelaxingMusicView: View {
    @State private var player: AVAudioPlayer?
    @State private var isPlaying = false

    var body: some View {
        VStack {
            Image("relaxing_music") // Make sure you have this image in your assets
                .resizable()
                .frame(width: 150, height: 150)
                .padding()

            Text("Listen to relaxing music.")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()

            // Play/Pause Button
            Button(action: {
                if isPlaying {
                    stopMusic()
                } else {
                    playMusic(named: "relaxing_music") // Replace with your actual file name
                }
                isPlaying.toggle()
            }) {
                Text(isPlaying ? "Pause Music" : "Play Music")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            .padding()

        }
        .navigationTitle("Relaxing Music")
        .onDisappear {
            stopMusic() // Stop music when the view disappears
        }
    }

    // Play music function
    func playMusic(named soundFileName: String) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") else {
            print("Audio file not found!")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1 // Loop the music indefinitely
            player?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }

    // Stop music function
    func stopMusic() {
        player?.stop()
    }
}

struct RelaxingMusicView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxingMusicView()
    }
}
