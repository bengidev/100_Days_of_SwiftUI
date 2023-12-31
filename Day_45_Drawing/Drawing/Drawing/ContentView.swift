//
//  ContentView.swift
//  Drawing
//
//  Created by Bambang Tri Rahmat Doni on 20/09/23.
//

import SwiftUI

/// Animating simple shapes with animatableData
///
struct Trapezoid: Shape {
    var insetAmount: Double

    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
    }
}

/// Animating complex shapes with AnimatablePair
///
struct Checkerboard: Shape {
    var rows: Int
    var columns: Int

    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(Double(rows), Double(columns)) }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)

        // Loop over all rows and columns, making alternating squares colored
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                if (row + column).isMultiple(of: 2) {
                    // This square should be colored
                    // Add rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

/// Creating a spirograph with SwiftUI
///
struct Spirograph: Shape {
    var innerRadius: Int
    var outerRadius: Int
    var distance: Int
    var amount: Double
    
    var animatableData: AnimatablePair<Double, AnimatablePair<Double, AnimatablePair<Double, Double>>> {
        get { AnimatablePair(Double(innerRadius), AnimatablePair(Double(outerRadius), AnimatablePair(Double(distance), amount))) }
        set {
            innerRadius = Int(newValue.first)
            outerRadius = Int(newValue.second.first)
            distance = Int(newValue.second.second.first)
            amount = newValue.second.second.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let innerRadius = Double(self.innerRadius)
        let outerRadius = Double(self.outerRadius)
        let distance = Double(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount
        
        var path = Path()
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint.init(x: x, y: y))
            } else {
                path.addLine(to: CGPoint.init(x: x, y: y))
            }
        }
        
        return path
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
}

struct ContentView: View {
    /// Special effects in SwiftUI: blurs, blending, and more
    ///
//    @State private var amount = 0.0

    /// Animating simple shapes with animatableData
    ///
    @State private var insetAmount = 50.0

    /// Animating complex shapes with AnimatablePair
    ///
    @State private var rows = 4
    @State private var columns = 4
    
    /// Creating a spirograph with SwiftUI
    ///
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount = 1.0
    @State private var hue = 0.6

    var body: some View {
        /// Special effects in SwiftUI: blurs, blending, and more
        ///
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//            .padding()
//
//            Slider(value: $amount)
//                .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.black)
//        .ignoresSafeArea()
//
//        VStack {
//            Image("apple_logo")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .saturation(amount)
//                .blur(radius: (1 - amount) * 20)
//
//            Slider(value: $amount)
//                .padding()
//        }
//        .padding()

        /// Animating simple shapes with animatableData
        ///
//        VStack {
//            Trapezoid(insetAmount: insetAmount)
//                .frame(width: 200, height: 100)
//                .onTapGesture {
//                    withAnimation {
//                        insetAmount = Double.random(in: 10 ... 90)
//                    }
//                }
//        }
//        .padding()

        /// Animating complex shapes with AnimatablePair
        ///
//        VStack {
//            Checkerboard(rows: rows, columns: columns)
//                .onTapGesture {
//                    withAnimation(.linear(duration: 3)) {
//                        rows = 8
//                        columns = 16
//                    }
//                }
//        }
//        .padding()
        
        /// Creating a spirograph with SwiftUI
        ///
        VStack(spacing: 0) {
            Spacer()
            
            Spirograph(innerRadius: Int(innerRadius),
                       outerRadius: Int(outerRadius),
                       distance: Int(distance),
                       amount: amount)
            .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
            .frame(width: 300, height: 300)
            .drawingGroup()
            
            Spacer()
            
            Group {
                Text("Inner Radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Outer Radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
                Slider(value: $amount)
                    .padding([.horizontal, .bottom])
                
                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
