//
//  CardView.swift
//  Flashzilla
//
//  Created by Bambang Tri Rahmat Doni on 01/10/23.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var removal: (() -> Void)?

    /// Coloring views as we swipe
    ///
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor
                        ? .white
                        : .white.opacity(1 - Double(abs(offset.width / 50))))
                .background(
                    differentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)

            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)

                if isShowingAnswer {
                    Spacer().frame(height: 10)
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    offset = gesture.translation
                })
                .onEnded({ _ in
                    if abs(offset.width) > 100 {
                        removal?()
                    } else {
                        offset = .zero
                    }
                })
        )
        .onTapGesture {
            withAnimation {
                isShowingAnswer.toggle()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
