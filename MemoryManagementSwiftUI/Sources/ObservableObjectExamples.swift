//
//  ObservableObjectExamples.swift
//  MemoryManagementSwiftUI
//
//  Created by Akshay Gandal on 30/01/26.
//

import SwiftUI
import Combine

final class TimerViewModel: ObservableObject {
    @Published var ticks = 0
    private var timer: AnyCancellable?

    init() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.ticks += 1
            }
    }

    deinit {
        print("TimerViewModel deinit")
    }
}

struct StateObjectExampleView: View {
    @StateObject private var viewModel = TimerViewModel()

    var body: some View {
        VStack {
            Text("@StateObject ticks: \(viewModel.ticks)")
            NavigationLink("Push child view") {
                ObservedObjectChildView(viewModel: viewModel)
            }
        }
    }
}

struct ObservedObjectChildView: View {
    @ObservedObject var viewModel: TimerViewModel

    var body: some View {
        Text("@ObservedObject child ticks: \(viewModel.ticks)")
    }
}
#Preview {
    StateObjectExampleView()
}
