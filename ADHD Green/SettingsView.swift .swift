//
//  SettingsView.swift .swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .padding()
            
            Text("Settings Page")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
