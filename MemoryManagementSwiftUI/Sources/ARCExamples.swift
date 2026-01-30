//
//  ARCExamples.swift
//  MemoryManagementSwiftUI
//
//  Created by Akshay Gandal on 30/01/26.
//

import SwiftUI

final class ARCTrackedObject {
    let id: Int

    init(id: Int) {
        self.id = id
        print("ARCTrackedObject \(id) init")
    }

    deinit {
        print("ARCTrackedObject \(id) deinit")
    }
}

struct ARCExamplesView: View {
    @State private var showObject = false

    var body: some View {
        VStack(spacing: 16) {
            Text("ARC & SwiftUI")
                .font(.title)

            Toggle("Create object", isOn: $showObject)
                .padding()

            if showObject {
                ARCObjectHolderView()
            }
        }
        .padding()
    }
}

struct ARCObjectHolderView: View {
    @State private var object: ARCTrackedObject? = ARCTrackedObject(id: 1)

    var body: some View {
        VStack {
            Text("Object is alive with id \(object?.id ?? -1)")
            Button("Release object") {
                object = nil
            }
        }
        .onDisappear {
            // When the view disappears and object is nil, deinit will have been called
        }
    }
}

#Preview {
    ARCExamplesView()
}
