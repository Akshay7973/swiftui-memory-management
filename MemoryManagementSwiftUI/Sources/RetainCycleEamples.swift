//
//  RetainCycleEamples.swift
//  MemoryManagementSwiftUI
//
//  Created by Akshay Gandal on 30/01/26.
//

import SwiftUI
import Combine

final class RetainCycleExample: ObservableObject {  // ← Add ": ObservableObject" here!
    @Published var value = "Hello"
    var closure: (() -> Void)?

    func createRetainCycle() {
        closure = {
            // self strongly captured → retain cycle!
            print(self.value)
        }
    }

    func breakRetainCycle() {
        closure = { [weak self] in
            guard let self else { return }
            print(self.value)
        }
    }

    deinit {
        print("RetainCycleExample deinit")
    }
}

// Rest of views unchanged...


struct RetainCycleExamplesView: View {
    @StateObject private var example = RetainCycleExample()
    @State private var showView = true

    var body: some View {
        VStack {
            Toggle("Show inner view", isOn: $showView)

            if showView {
                InnerRetainCycleView(example: example)
            }
        }
    }
}

struct InnerRetainCycleView: View {
    @ObservedObject var example: RetainCycleExample

    var body: some View {
        VStack {
            Button("Create retain cycle") {
                example.createRetainCycle()
            }
            Button("Break retain cycle") {
                example.breakRetainCycle()
            }
        }
    }
}
