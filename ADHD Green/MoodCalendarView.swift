//
//  MoodCalendarView.swift
//  ADHD Green
//
//  Created by kimia asadzadeh on 05/03/25.
//

import SwiftUI

struct MoodCalendarView: View {
    @State private var selectedDate = Date()
    @State private var moods: [Date: String] = [:]

    let moodEmojis = ["😃", "😌", "😢", "😰"]
    
    var body: some View {
        VStack {
            Text("Select Mood for Each Day")
                .font(.title2)
                .bold()
                .padding()

            // کلندر انتخاب روز
            DatePicker("Choose a Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            // ایموجی‌های انتخاب مود
            HStack(spacing: 20) {
                ForEach(moodEmojis, id: \.self) { emoji in
                    Button(action: {
                        moods[selectedDate] = emoji
                    }) {
                        Text(emoji)
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
            .padding(.vertical, 10)

            // نمایش مودهای ثبت شده
            List {
                ForEach(moods.keys.sorted(), id: \.self) { date in
                    HStack {
                        Text(formatDate(date))
                        Spacer()
                        Text(moods[date] ?? "🙂")
                    }
                }
            }
            .frame(height: 250)
            
            Spacer()
        }
    }

    // تبدیل تاریخ به فرمت خوانا
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct MoodCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MoodCalendarView()
    }
}
