//
//  StateAndBindingsExamples.swift
//  MemoryManagementSwiftUI
//
//  Created by Akshay Gandal on 30/01/26.
//

import SwiftUI

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(count)")
                .font(.title)

            Stepper("Increment", value: $count)

            CounterChildView(count: $count)
        }
        .padding()
    }
}

struct CounterChildView: View {
    @Binding var count: Int

    var body: some View {
        VStack(spacing: 8) {
            Text("Child sees count: \(count)")
            Button("Add 10 in child") {
                count += 10
            }
        }
    }
}
#Preview {
    CounterView()
}
