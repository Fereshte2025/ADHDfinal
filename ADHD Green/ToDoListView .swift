//
//  ToDoListView .swift
//  ADHD Green
//
//  Created by Fereshte Ehsani on 03/03/25.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        VStack {
            Image("todo_list")
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Manage your tasks effectively.")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle("To Do List")
    }
}
