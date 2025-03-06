//
//  BreathView.swift .swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct BreathView: View {
    @State private var isBreathing = false
    @State private var breathPhase = "Inhale"
    
    // تعریف رنگ‌های جدید
    let backgroundColor = Color(red: 0.91, green: 0.87, blue: 0.80)  // ⬅️ بک‌گراند کرم
    let buttonColor = Color(red: 0.62, green: 0.71, blue: 0.65)  // ⬅️ دکمه سبز
    
    var body: some View {
        ZStack {
            // بک‌گراند کرم
            backgroundColor
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Breathing Exercise")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)  // ⬅️ متن مشکی
                    .padding(.top, 20)
                

                Spacer()

                ZStack {
                    // دایره تنفس
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(buttonColor.opacity(0.7))  // ⬅️ رنگ دایره هماهنگ با دکمه
                        .scaleEffect(isBreathing ? 1.4 : 1)
                        .animation(.easeInOut(duration: 4), value: isBreathing)

                    Text(breathPhase)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)

                
            
                // شروع تمرین تنفس
                Button(action: {
                    startBreathingCycle()
                }) {
                    Text("Start Breathing")
                    
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(buttonColor)  // ⬅️ دکمه سبز
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                    
                }

                Spacer()
            }
           
        }
        
    }

    // شروع چرخه تنفس
    private func startBreathingCycle() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            isBreathing = true
            breathPhase = "Inhale"

            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                breathPhase = "Hold"

                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isBreathing = false
                    breathPhase = "Exhale"

                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        startBreathingCycle()
                    }
                }
            }
        }
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathView()
    }
}
