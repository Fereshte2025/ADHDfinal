//
//  PomodoroView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI
import AVFoundation

struct PomodoroView: View {
    @State private var timeRemaining = 25 * 60 // ۲۵ دقیقه
    @State private var isRunning = false
    @State private var isBreakTime = false
    @State private var timer: Timer?
    
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        VStack {
            Text("Pomodoro Timer")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            // دایره تایمر
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .foregroundColor(Color.gray.opacity(0.3))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(timeRemaining) / CGFloat(isBreakTime ? 5 * 60 : 25 * 60))
                    .stroke(isBreakTime ? Color.green : Color.blue, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: timeRemaining)
                
                Text("\(formatTime(timeRemaining))")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
            }
            .frame(width: 200, height: 200)
            
            Spacer()
            
            // دکمه‌های کنترل تایمر
            VStack(spacing: 10) {
                Button(action: {
                    toggleTimer()
                }) {
                    Text(isRunning ? "Pause" : "Start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 160, height: 50)
                        .background(Color(red: 0.36, green: 0.47, blue: 0.42))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    skipBreak()
                }) {
                    Text("Skip Break")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 160, height: 50)
                        .background(Color(red: 0.73, green: 0.64, blue: 0.57))
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
        .onDisappear {
            stopTimer()
        }
    }
    
    // توابع
    func formatTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func toggleTimer() {
        if isRunning {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    func startTimer() {
        isRunning = true
        playWhiteNoise()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                switchMode()
            }
        }
    }
    
    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
        stopAudio()
    }
    
    func switchMode() {
        if isBreakTime {
            timeRemaining = 25 * 60 // بازگشت به زمان کار
            isBreakTime = false
            playWhiteNoise()
        } else {
            timeRemaining = 5 * 60 // تغییر به استراحت
            isBreakTime = true
            playRelaxingMusic()
        }
        startTimer()
    }
    
    func skipBreak() {
        if isBreakTime {
            timeRemaining = 25 * 60
            isBreakTime = false
            stopAudio()
            startTimer()
        }
    }
    
    // مدیریت صوت
    func playWhiteNoise() {
        playSound(named: "white_noise.mp3")
    }
    
    func playRelaxingMusic() {
        playSound(named: "relaxing_music.mp3")
    }
    
    func playSound(named soundFileName: String) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: nil) else { return }
        
        do {


player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()
        } catch {
            print("خطا در پخش صدا: \(error)")
        }
    }
    
    func stopAudio() {
        player?.stop()
    }
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
    }
}
