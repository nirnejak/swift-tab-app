//
//  ContentView.swift
//  helloworld
//
//  Created by Jitendra Nirnejak on 21/12/19.
//  Copyright © 2019 Jitendra Nirnejak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var count = 0
    @State private var users = [
        ["name": "Jitendra", "age": 21],
        ["name": "Jaskaran", "age": 23],
        ["name": "Rupinder", "age": 24],
    ]

 
    var body: some View {
        TabView(selection: $selection){
            Text("Fist View")
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
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
                HStack {
                    Button(action: {
                        // print("Reset Count")
                        self.count = 0
                    }) { Text("Reset Count") }
                    Button(action: {
                        // print("Count Incremented")
                        self.count += 1
                    }) { Text("Increment Count") }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
