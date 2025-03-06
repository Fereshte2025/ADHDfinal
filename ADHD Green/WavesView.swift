//
//  WavesView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct WaveView: View {
    @State private var phase: CGFloat = 0.0  // فاز متحرک برای ایجاد موج پیوسته

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height * 0.15  // ارتفاع موج

            Path { path in
                path.move(to: CGPoint(x: 0, y: height))

                for x in stride(from: 0, through: width, by: 1) { // حرکت نرم‌تر
                    let relativeX = x / width
                    let sine = sin((relativeX * 2 * .pi) + phase)  // حرکت سینوسی واقعی
                    let y = height + sine * 20  // تنظیم ارتفاع موج
                    
                    path.addLine(to: CGPoint(x: x, y: y))
                }

                path.addLine(to: CGPoint(x: width, y: height * 2))
                path.addLine(to: CGPoint(x: 0, y: height * 2))
                path.closeSubpath()
            }
            .fill(Color.blue.opacity(0.4)) // رنگ موج
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    phase -= .pi * 2  // حرکت مداوم موج
                }
            }
        }
        .frame(height: 100)
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}
