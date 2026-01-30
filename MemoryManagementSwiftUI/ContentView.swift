//
//  ContentView.swift
//  MemoryManagementSwiftUI
//
//  Created by Akshay Gandal on 30/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("SwiftUI Memory Management")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                NavigationLink("1. ARC Basics") {
                    ARCExamplesView()
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("2. @State & @Binding") {
                    CounterView()
                }
                .buttonStyle(.bordered)

                NavigationLink("3. @StateObject vs @ObservedObject") {
                    StateObjectExampleView()
                }
                .buttonStyle(.bordered)

                NavigationLink("4. Retain Cycles") {
                    RetainCycleExamplesView()
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .navigationTitle("Memory Examples")
        }
    }
}

#Preview {
    ContentView()
}

