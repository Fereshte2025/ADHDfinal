//
//  EmotionTrackingView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct EmotionTrackingView: View {
    var body: some View {
        VStack {
            Image("emotion_tracking")
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Track your emotions daily.")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle("Emotion Tracking")
    }
}
