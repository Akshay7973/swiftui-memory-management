# SwiftUI Memory Management Examples

A small SwiftUI project that demonstrates how memory management works with ARC, value vs reference types, and common SwiftUI state property wrappers.

## Topics Covered

- Automatic Reference Counting (ARC) basics in Swift.
- Local view state with `@State` and data flow with `@Binding`.
- Reference-type models and `ObservableObject`.
- Differences between `@StateObject` and `@ObservedObject`.
- Retain cycles with closures and how to avoid them using `[weak self]`.

## Why This Repo Exists

SwiftUI hides a lot of complexity behind a declarative syntax, but it still relies on Swift ARC to manage memory for reference-type objects such as `ObservableObject` view models.[web:4][web:5][web:14] This repo shows small, focused examples so you can see when objects are created, when they are deallocated, and how different property wrappers affect object lifetimes.[web:1][web:3][web:11]

## Repository Structure

- `Sources/ARCExamples.swift` – Basic ARC logging and object lifetime experiments.
- `Sources/StateAndBindingsExamples.swift` – `@State` and `@Binding` examples.
- `Sources/ObservableObjectExamples.swift` – `ObservableObject` with `@StateObject` and `@ObservedObject`.
- `Sources/RetainCycleExamples.swift` – Retain cycle and `[weak self]` examples.

You can hook these views into a simple `NavigationStack` or `TabView` inside `ContentView` to navigate between them.

## Key Concepts

### 1. ARC in Swift

Swift uses Automatic Reference Counting (ARC) for class instances, increasing a reference count when you create or hold a strong reference and decreasing it when references are released.[web:4][web:14] When the count reaches zero, the instance is deallocated and `deinit` is called.[web:14]

### 2. `@State` and `@Binding`

- `@State` stores simple, local value-type state for a single view (e.g. `Int`, `Bool`, small structs) and is owned by that view.[web:5][web:8]
- `@Binding` passes a reference-like handle to some `@State` so child views can read and write it without owning it.[web:5][web:8]

### 3. `@StateObject` vs `@ObservedObject`

- Use `@StateObject` when the view **creates and owns** an `ObservableObject` and should keep a strong reference to it across body recomputations.[web:1][web:3][web:4][web:11]
- Use `@ObservedObject` when the object is created elsewhere and **injected** into the view; the view observes changes but does not own the lifecycle.[web:1][web:3][web:4][web:11]

This prevents accidental re-creation of heavy view models and ensures consistent state across navigation and redraws.[web:3][web:5]

### 4. Retain Cycles and `[weak self]`

When an object stores a closure that captures `self` strongly, the object and closure can keep each other alive, causing a retain cycle.[web:4][web:14] Capturing `self` weakly (`[weak self]`) or unowned breaks the cycle so ARC can deallocate the object correctly.[web:14]

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/swiftui-memory-management.git
   cd swiftui-memory-management

