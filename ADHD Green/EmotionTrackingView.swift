//
//  EmotionTrackingView.swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI
import Charts

struct EmotionTrackingView: View {
    @State private var moodData: [MoodEntry] = [
        MoodEntry(day: "Mon", mood: 1),
        MoodEntry(day: "Tue", mood: 2),
        MoodEntry(day: "Wed", mood: 3),
        MoodEntry(day: "Thu", mood: 4),
        MoodEntry(day: "Fri", mood: 2),
        MoodEntry(day: "Sat", mood: 5),
        MoodEntry(day: "Sun", mood: 3)
    ]
    
    @State private var selectedMood: Int? = nil
    @State private var showCalendar = false  // متغیر باز شدن کلندر

    let moodEmojis = ["😃", "😌", "😢", "😰"]
    let moodNames = ["Happy", "Relaxed", "Sad", "Stressed"]

    // تعریف رنگ‌های جدید
    let backgroundColor = Color(red: 0.73, green: 0.64, blue: 0.57)  // ⬅️ بک‌گراند کرم
    let buttonColor = Color(red: 0.36, green: 0.47, blue: 0.42)  // ⬅️ دکمه سبز
    let chartBackground = Color.white  // ⬅️ پس‌زمینه چارت سفید

    var body: some View {
        ZStack {
            // بک‌گراند کرم
            backgroundColor
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Emotion Tracking")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)  // متن مشکی
                    .padding(.top, 20)

                Text("How are you feeling today?")
                    .font(.headline)
                    .foregroundColor(.black)  // متن مشکی
                    .padding(.bottom, 10)

                // چارت هفتگی
                Chart {
                    ForEach(moodData) { entry in
                        LineMark(
                            x: .value("Day", entry.day),
                            y: .value("Mood", entry.mood)
                        )
                        .foregroundStyle(Color.blue)

                        PointMark(
                            x: .value("Day", entry.day),
                            y: .value("Mood", entry.mood)
                        )
                        .foregroundStyle(entry.color)
                    }
                }
                .frame(height: 200)
                .padding(.horizontal, 20)
                .background(chartBackground) // ⬅️ پس‌زمینه چارت سفید
                .cornerRadius(12)
                .padding(.bottom, 10)

                // انتخاب مود با ایموجی
                HStack(spacing: 20) {
                    ForEach(0..<moodEmojis.count, id: \.self) { index in
                        Button(action: {
                            selectedMood = index + 1
                            updateMood(for: "Sun", mood: index + 1)
                        }) {
                            VStack {
                                Text(moodEmojis[index])
                                    .font(.largeTitle)
                                Text(moodNames[index])
                                    .font(.caption)
                                    .foregroundColor(.black)  // متن مشکی
                            }
                        }
                    }
                }
                .padding(.top, 10)

                // دکمه Journal Entry برای باز کردن کلندر
                Button(action: {
                    showCalendar = true  // ⬅️ باز کردن کلندر
                }) {
                    Text("Journal Entry")
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(buttonColor)  // ⬅️ دکمه سبز
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.top, 10)
                .sheet(isPresented: $showCalendar) {  // ⬅️ نمایش `MoodCalendarView`
                    MoodCalendarView()
                }

                Spacer()
            }
        }
    }
    // بروزرسانی مود برای روز خاص
        private func updateMood(for day: String, mood: Int) {
            if let index = moodData.firstIndex(where: { $0.day == day }) {
                moodData[index].mood = mood
            }
        }
    }

    // مدل داده‌ای مود روزانه
    struct MoodEntry: Identifiable {
        let id = UUID()
        let day: String
        var mood: Int

        var color: Color {
            switch mood {
            case 1: return .green
            case 2: return .yellow
            case 3: return .orange
            case 4: return .red
            case 5: return .purple
            default: return .gray
            }
        }
    }

    struct EmotionTrackingView_Previews: PreviewProvider {
        static var previews: some View {
            EmotionTrackingView()
        }
    }
