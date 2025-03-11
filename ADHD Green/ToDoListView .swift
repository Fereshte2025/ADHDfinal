//
//  ToDoListView .swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct ToDoListView: View {
    @State private var tasks: [Task] = []  // لیست تسک‌ها
    @State private var newTaskTitle: String = ""  // ورودی برای اضافه کردن تسک جدید
    @State private var score = 0  // امتیاز کاربر
    @State private var dailyGoal = 3  // هدف روزانه (دیفالت: ۳ تسک)
    
    var body: some View {
        NavigationView {
            VStack {
                // نمایش عنوان و امتیاز
                VStack(alignment: .leading) {
                    Text("To-Do List")
                        .font(.largeTitle)
                        .bold()
                    
            
                        .font(.title2)
                        .bold()
                        .foregroundColor(.brown)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top)

                // نمایش هدف روزانه + آیکون todo_list
                HStack {
                    Image("todo_list") // اینجا آیکون کوچک اضافه می‌شود
                        .resizable()
                        .frame(width: 54, height: 54)
                        .padding(.trailing, 5)  // فاصله از عنوان
                    Text("Daily Goal: \(dailyGoal)")
                        .font(.headline)
                    
                    Spacer()
                    
                    Picker("Goal", selection: $dailyGoal) {
                        Text("3").tag(3)
                        Text("5").tag(5)
                        Text("10").tag(10)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                }
                .padding(.horizontal)

                // ورودی برای اضافه کردن تسک جدید
                HStack {
                    TextField("Add a new task...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor (.brown)
                            .font(.title2)
                    }
                }
                .padding()

                // لیست تسک‌ها با رنگ‌بندی یکی در میان
                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        TaskRow(
                            task: $tasks[index],
                            onTaskCompleted: { completeTask(index) },
                            backgroundColor: index.isMultiple(of: 2) ?
                                Color(red: 0.36, green: 0.47, blue: 0.42) :
                                Color(red: 0.73, green: 0.64, blue: 0.57)
                        )
                    }
                    .onDelete(perform: deleteTask)  // حذف تسک‌ها با سوایپ
                }
                
                Spacer()

                // نمایش Congratulations در محل مشخص‌شده
                if score >= dailyGoal {
                    Text("🎉 Congratulations! You reached your  daily goal!")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.vertical, 15)
                }

                // چارت میزان پیشرفت روزانه
                VStack {
                    ProgressView(value: Double(score), total: Double(dailyGoal))
                        .progressViewStyle(LinearProgressViewStyle())
                        .frame(width: 250)
                        .padding()
                }
                .padding(.bottom)
            }
            .navigationBarHidden(true) // حذف نوار ناوبری برای چیدمان بهتر
        }
    }
private func addTask() {
    if !newTaskTitle.isEmpty {
        tasks.append(Task(title: newTaskTitle))
        newTaskTitle = ""
    }
}

// مارک کردن تسک به عنوان انجام‌شده و افزایش امتیاز
private func completeTask(_ taskIndex: Int) {
    if !tasks[taskIndex].isCompleted {
        tasks[taskIndex].isCompleted = true
        score += 1  // افزایش امتیاز وقتی تسک برای اولین بار تکمیل می‌شود
    } else {
        tasks[taskIndex].isCompleted = false
        score -= 1  // کاهش امتیاز اگر کاربر تسک را از حالت انجام‌شده خارج کند
    }
}

// حذف تسک‌ها با سوایپ
private func deleteTask(at offsets: IndexSet) {
    for index in offsets {
        if tasks[index].isCompleted {
            score -= 1  // اگر تسک انجام شده بود، امتیاز کم شود
        }
    }
    tasks.remove(atOffsets: offsets)
}
}

// مدل تسک
struct Task: Identifiable {
let id = UUID()
var title: String
var isCompleted: Bool = false
}

// نمایش هر تسک و قابلیت مارک کردن به عنوان انجام‌شده
struct TaskRow: View {
@Binding var task: Task
var onTaskCompleted: () -> Void
var backgroundColor: Color

var body: some View {
    HStack {
        Button(action: { onTaskCompleted() }) {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .black : .white)
        }

        Text(task.title)
            .strikethrough(task.isCompleted)
            .font(.headline)
            .foregroundColor(.white)

        Spacer()
    }
    .padding()
    .background(backgroundColor)
    .cornerRadius(10)
    .padding(.vertical, 5)
}
}

struct ToDoListView_Previews: PreviewProvider {
static var previews: some View {
    ToDoListView()
}
}
