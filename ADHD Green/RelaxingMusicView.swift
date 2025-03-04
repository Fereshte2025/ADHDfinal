//
//  RelaxingMusicView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct RelaxingMusicView: View {
    var body: some View {
        VStack {
            Image("relaxing_music")
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Listen to relaxing music.")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle("Relaxing Music")
    }
}
