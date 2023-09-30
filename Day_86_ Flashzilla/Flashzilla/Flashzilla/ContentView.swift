//
//  ContentView.swift
//  Flashzilla
//
//  Created by Bambang Tri Rahmat Doni on 30/09/23.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    /// How to use gestures in SwiftUI
    ///
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0

//    @State private var currentAmount = Angle.zero
//    @State private var finalAmount = Angle.zero

    // How far the circle has been dragged
    @State private var offset = CGSize.zero

    // Whether it is currently being dragged or not
    @State private var isDragging = false

    /// Making vibrations with UINotificationFeedbackGenerator and Core Haptics
    ///
    @State private var engine: CHHapticEngine?

    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onTapGesture(count: 2) {
//            print("Double tapped!")
//        }

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onLongPressGesture {
//            print("Long pressed!")
//        }

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onLongPressGesture(minimumDuration: 2) {
//            print("Long pressed!")
//        }

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onLongPressGesture(minimumDuration: 1) {
//            print("Long pressed!")
//        } onPressingChanged: { inProgress in
//            print("In Progress: \(inProgress)")
//        }

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .scaleEffect(finalAmount + currentAmount)
//        .gesture(MagnificationGesture()
//            .onChanged({ amount in
//                currentAmount = amount - 1
//            })
//            .onEnded({ _ in
//                finalAmount += currentAmount
//                currentAmount = 0
//            })
//        )

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .rotationEffect(finalAmount + currentAmount)
//        .gesture(RotationGesture()
//            .onChanged({ angle in
//                currentAmount = angle
//            })
//            .onEnded({ angle in
//                finalAmount += currentAmount
//                currentAmount = .zero
//            })
//        )

//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//                .onTapGesture {
//                    print("Text tapped!")
//                }
//        }
//        .padding()
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded({ _ in
//                    print("VStack tapped!")
//                })
//        )

        // A drag gesture that updates offset and
        // isDragging as it moves around
//        let dragGesture = DragGesture()
//            .onChanged { offset = $0.translation }
//            .onEnded { _ in
//                withAnimation {
//                    offset = .zero
//                    isDragging = false
//                }
//            }
//
//        // A long press gesture that enables isDragging
//        let pressGesture = LongPressGesture()
//            .onEnded { _ in
//                withAnimation {
//                    isDragging = true
//                }
//            }
//
//        // A combined gesture that forces the user
//        // to long press then drag
//        let combined = pressGesture.sequenced(before: dragGesture)
//
//        // A 64x64 circle that scales up when it's dragged,
//        // sets its offset to whatever we had back from the drag gesture,
//        // and uses our combined gesture
//        Circle()
//            .fill(.red)
//            .frame(width: 64, height: 64)
//            .scaleEffect(isDragging ? 1.5 : 1)
//            .offset(offset)
//            .gesture(combined)

        /// Making vibrations with UINotificationFeedbackGenerator and Core Haptics
        ///
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//                .onTapGesture {
//                    print("Text tapped!")
//                }
//        }
//        .padding()
//        .onAppear(perform: prepareHaptics)
//        .onTapGesture(perform: complexSuccess)
        
        /// Disabling user interactivity with allowsHitTesting()
        ///
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//
////            Circle()
////                .fill(.red)
////                .frame(width: 300, height: 300)
////                .allowsHitTesting(false)
////                .onTapGesture {
////                    print("Circle tapped!")
////                }
//
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
//        }
//        .padding()
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }

    private func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }

    private func complexSuccess() {
        // Make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        var events = [CHHapticEvent]()

//        // Create one intense, sharp tap
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
//        let event  = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//        events.append(event)

        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }

        // Convert those events into a pattern and play it immidiately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
