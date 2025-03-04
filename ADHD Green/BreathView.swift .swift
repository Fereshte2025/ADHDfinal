//
//  BreathView.swift .swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct BreathView: View {
    @State private var scale: CGFloat = 1.0
    @State private var breathPhase = "Inhale"
    
    var body: some View {
        VStack {
            Text("Breathing Exercise")
                .font(.largeTitle)
                .padding(.top, 50)
            
            Spacer()
            
            Circle()
                .fill(Color.green.opacity(0.7))
                .frame(width: 100 * scale, height: 100 * scale)
                .animation(.easeInOut(duration: 4), value: scale) // انیمیشن نرم برای تغییر اندازه
            
            Text(breathPhase)
                .font(.title)
                .padding(.top, 20)
            
            Spacer()
        }
        .onAppear {
            startBreathingCycle()
        }
    }
    
    func startBreathingCycle() {
        Timer.scheduledTimer(withTimeInterval: 12, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 4)) {
                scale = 2.0
                breathPhase = "Inhale"
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                breathPhase = "Hold 5 Seconds"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation(.easeInOut(duration: 4)) {
                        scale = 1.0
                        breathPhase = "Exhale"
                    }
                }
            }
        }
    }
}

struct BreathView_Previews: PreviewProvider {
    static var previews: some View {
        BreathView()
    }
}
