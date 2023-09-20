//
//  ContentView.swift
//  Drawing
//
//  Created by Bambang Tri Rahmat Doni on 20/09/23.
//

import SwiftUI

/// Transforming shapes using CGAffineTransform and even-odd fills
///
struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20

    // How wide to make each petal
    var petalWidth: Double = 100

    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()

        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // Rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)

            // Move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

            // Create a path for this petal using our properties plus a fiex Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))

            // Apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // Add it to our main path
            path.addPath(rotatedPetal)
        }

        // Now send the main path back
        return path
    }
}

/// Enabling high-performance Metal rendering with drawingGroup()
///
struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0 ..< steps, id: \.self) { value in
                Circle().inset(by: Double(value))
                    .strokeBorder(LinearGradient(
                        colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    private func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue = targetHue - 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    /// Transforming shapes using CGAffineTransform and even-odd fills
    ///
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0

    /// Enabling high-performance Metal rendering with drawingGroup()
    ///
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: true))

            Text("Offset")
            Slider(value: $petalOffset, in: -40 ... 40)
                .padding([.horizontal, .bottom])

            Text("Width")
            Slider(value: $petalWidth, in: 0 ... 100)
                .padding(.horizontal)
        }
        .padding()

        /// Creative borders and fills using ImagePaint
        ///
        VStack {
            Capsule()
                .strokeBorder(ImagePaint(image: Image("apple_logo"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
        }

        /// Enabling high-performance Metal rendering with drawingGroup()
        ///
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
