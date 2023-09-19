//
//  ContentView.swift
//  Drawing
//
//  Created by Bambang Tri Rahmat Doni on 20/09/23.
//

import SwiftUI

/// Paths vs shapes in SwiftUI
///
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.init(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint.init(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint.init(x: rect.midX, y: rect.minY))
        
        return path
    }
}

/// Adding strokeBorder() support with InsettableShape
///
struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint.init(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2 - insetAmount,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
        
    }
}

struct ContentView: View {
    var body: some View {
        /// Creating custom paths with SwiftUI
        ///
//        VStack {
//            Path { path in
//                path.move(to: CGPoint.init(x: 200, y: 100))
//                path.addLine(to: CGPoint.init(x: 100, y: 300))
//                path.addLine(to: CGPoint.init(x: 300, y: 300))
//                path.addLine(to: CGPoint.init(x: 200, y: 100))
//                path.closeSubpath()
//            }
////            .fill(.blue)
//            .stroke(.blue, style: StrokeStyle.init(lineWidth: 10, lineCap: .round, lineJoin: .round))
//        }
        
        /// Paths vs shapes in SwiftUI
        ///
//        VStack {
//            Triangle()
////                .fill(.red)
//                .stroke(.red, style: StrokeStyle.init(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                .frame(width: 300, height: 300)
//        }
        
//        VStack {
//            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//                .stroke(.blue, lineWidth: 10)
//                .frame(width: 300, height: 300)
//        }
        
        /// Adding strokeBorder() support with InsettableShape
        ///
        VStack {
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(.blue, lineWidth: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
