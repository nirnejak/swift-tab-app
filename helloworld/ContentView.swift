//
//  ContentView.swift
//  helloworld
//
//  Created by Jitendra Nirnejak on 21/12/19.
//  Copyright © 2019 Jitendra Nirnejak. All rights reserved.
//

import SwiftUI
import Foundation
import Alamofire
import SwiftyJSON

struct Todo: Codable, Equatable, Identifiable {
    var id: Int
    var title: String
    var userId: Int
    var completed: Bool
}

struct ContentView: View {
    @State private var selection = 0
    @State private var count = 0
    
    @State private var todos:[Todo] = [
        Todo(id: 1, title: "First Task", userId: 1, completed: false),
        Todo(id: 2, title: "Second Task", userId: 2, completed: true),
        Todo(id: 3, title: "Third Task", userId: 3, completed: false),
        Todo(id: 4, title: "Fourth Task", userId: 4, completed: false),
        Todo(id: 5, title: "Fifth Task", userId: 5, completed: true),
        Todo(id: 6, title: "Sixth Task", userId: 6, completed: true),
        Todo(id: 7, title: "Seventh Task", userId: 7, completed: false),
        Todo(id: 8, title: "Eight Task", userId: 8, completed: true),
        Todo(id: 9, title: "Nineth Task", userId: 9, completed: false),
        Todo(id: 10, title: "Tenth Task", userId: 10, completed: false),
        Todo(id: 11, title: "Evelenth Task", userId: 11, completed: false),
        Todo(id: 12, title: "Twelth Task", userId: 12, completed: true),
        Todo(id: 13, title: "Thirteenth Task", userId: 13, completed: true),
        Todo(id: 14, title: "Fourteenth Task", userId: 14, completed: true),
        Todo(id: 15, title: "Fifteenth Task", userId: 15, completed: true),
        Todo(id: 16, title: "Sixteenth Task", userId: 16, completed: true),
        Todo(id: 17, title: "Seventeen Task", userId: 17, completed: false)
    ]
    
    let data = Alamofire.request("https://jsonplaceholder.typicode.com/todos/")
        .responseJSON { response in
            if let result = response.result.value {
                let JSONData = JSON(result)
                print(JSONData)
            }
    }

    var body: some View {
        TabView(selection: $selection){
            NavigationView {
                List {
                    ForEach(todos, id: \.id) { todo in
                        HStack {
                            Text(todo.title)
                            Spacer()
                            Button(action: { self.toggleTodo(index: todo.id-1) })
                            { Text(todo.completed ? "✅" : "❌") }
                        }
                    }
                }.navigationBarTitle("Todo Tasks")
            }
                .tabItem {
                    VStack {
                        Image("first")
                        Text("List")
                    }
                }
                .tag(0)
            VStack {
                Text("Data Fetch").font(.title).padding(100)
                Button(action: { print("Second View Button Clicked") }) { Text("Action Button") }
                Rectangle()
            }
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
            VStack {
                Spacer()
                Text("\(self.count)").font(.title)
                Text("Counter")
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { self.resetCount() }) { Text("Reset Count") }
                    Spacer()
                    Button(action: { self.incrementCount() }) { Text("Increment Count") }
                    Spacer()
                }
                Spacer()
            }
                .tabItem {
                    VStack {
                        Image("third")
                        Text("Counter")
                    }
                }
                .tag(3)
        }
    }
    
    func toggleTodo(index: Int) {
        self.todos[index].completed = !self.todos[index].completed
    }
    
    func resetCount() {
        count = 0
    }
    
    func incrementCount() {
        count += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
