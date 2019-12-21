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

struct Task: Codable, Equatable, Identifiable {
    var id: Int
    var title: String
    var userId: Int
    var completed: Bool
}

struct ContentView: View {
    @State private var selection = 0
    @State private var count = 0
    
    @State private var todos:[Task] = [
        Task(id: 1, title: "First Task", userId: 1, completed: false),
        Task(id: 2, title: "Second Task", userId: 2, completed: true),
        Task(id: 3, title: "Third Task", userId: 3, completed: false),
        Task(id: 4, title: "Fourth Task", userId: 4, completed: true),
        Task(id: 5, title: "Fifth Task", userId: 5, completed: false),
        Task(id: 6, title: "Sixth Task", userId: 6, completed: true),
        Task(id: 7, title: "Seventh Task", userId: 7, completed: false),
        Task(id: 8, title: "Eight Task", userId: 8, completed: true),
        Task(id: 9, title: "Nineth Task", userId: 9, completed: false),
        Task(id: 10, title: "Tenth Task", userId: 10, completed: true),
        Task(id: 11, title: "Evelenth Task", userId: 11, completed: false),
        Task(id: 12, title: "Twelth Task", userId: 12, completed: true),
        Task(id: 13, title: "Thirteenth Task", userId: 13, completed: false),
        Task(id: 14, title: "Fourteenth Task", userId: 14, completed: true),
        Task(id: 15, title: "Fifteenth Task", userId: 15, completed: false),
        Task(id: 16, title: "Sixteenth Task", userId: 16, completed: true),
        Task(id: 17, title: "Seventeen Task", userId: 17, completed: false)
    ]

    var body: some View {
        TabView(selection: $selection){
            NavigationView {
                List {
                    ForEach(todos, id: \.id) { todo in
                        Text(todo.title)
                    }
                }.navigationBarTitle("List View")
            }
                .tabItem {
                    VStack {
                        Image("first")
                        Text("List")
                    }
                }
                .tag(0)
            VStack {
                Text("Data Fetch").font(.title).background(Color.blue).padding(10)
                Button(action: { self.fetchData() }) { Text("Fetch Data") }
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
                Text("Counter View").font(.title)
                Text("Count: \(count)")
                Spacer()
                HStack {
                    Button(action: { self.resetCount() }) { Text("Reset Count") }
                    Button(action: { self.incrementCount() }) { Text("Increment Count") }
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
    
    func resetCount() {
        count = 0
    }
    
    func incrementCount() {
        count += 1
    }
    
    func fetchData() {
        var todos:JSON = []
        Alamofire.request("https://jsonplaceholder.typicode.com/todos/").responseJSON { response in
            if let result = response.result.value {
                todos = JSON(result)
                print(todos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
