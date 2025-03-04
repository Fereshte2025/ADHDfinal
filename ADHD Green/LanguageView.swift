//
//  LanguageView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct LanguageView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .padding()
            
            Text("Choose Your Language")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Language")
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView()
    }
}
