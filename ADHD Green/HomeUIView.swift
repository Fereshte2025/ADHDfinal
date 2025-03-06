//
//  HomeUIView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct HomeUIView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    NavigationLink(destination: BreathView()) {
                        FeatureCard(title: "Breath", imageName: "breathing_exercise", bgColor: Color(red: 0.36, green: 0.47, blue: 0.42))
                    }
                    
                    NavigationLink(destination: PomodoroView()) {
                        FeatureCard(title: "Pomodoro Timer", imageName: "pomodoro_timer", bgColor: Color(red: 0.73, green: 0.64, blue: 0.57))
                    }
                    
                    NavigationLink(destination: ToDoListView()) {
                        FeatureCard(title: "To Do List", imageName: "todo_list", bgColor: Color(red: 0.50, green: 0.60, blue: 0.55))
                    }
                    NavigationLink(destination: RelaxingMusicView()) {
                        FeatureCard(title: "Relaxing Music", imageName: "relaxing_music", bgColor: Color(red: 0.73, green: 0.64, blue: 0.57))
                    }
                    
                    NavigationLink(destination: EmotionTrackingView()) {
                        FeatureCard(title: "Emotion Tracking", imageName: "emotion_tracking", bgColor: Color(red: 0.50, green: 0.60, blue: 0.55))
                    }
                }
                .padding()
            }
            .navigationTitle("Choose Your Plan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

// کامپوننت برای نمایش هر گزینه
struct FeatureCard: View {
    let title: String
    let imageName: String
    let bgColor: Color  // دریافت رنگ پس‌زمینه

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 80)
        .background(bgColor)  // رنگ پس‌زمینه‌ی کارت‌ها
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
