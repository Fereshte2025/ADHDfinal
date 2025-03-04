//
//  ProfileView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding()
            
            Text("User Profile")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
