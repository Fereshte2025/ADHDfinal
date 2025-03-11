//
//  GetStartedview.swift .swift
//  ADHD Green
//
//  Created by kimia asadzadeh on 05/03/25.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // پس‌زمینه کرم
                Color(red: 0.90, green: 0.86, blue: 0.80)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    // لوگو
                    Image("page 6 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 360, height: 240)
                        .padding(.top, 100)

                    // متن خوش‌آمدگویی
                    Text("Manage your mind, \nStress-free!")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)

                    // دکمه Get Started
                    NavigationLink(destination: ContentView()) {
                        Text("Get Started")
                            .bold()
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color(red: 0.36, green: 0.47, blue: 0.42)) // رنگ سبز ملایم
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top, 20)

                    Spacer()
                }
            }
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
