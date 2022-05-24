//
//  Styles.swift
//  iOS_Challenge_iTunes
//
//  Created by Arturo Diaz on 24/05/22.
//

import SwiftUI

extension View {
    func boxedFrame(bgColor: Color, radius: CGFloat, shadowColor: Color, shadowRadius: CGFloat, shadowYOffset: CGFloat) -> some View {
        self
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowYOffset)
    }
    
    func dashedBoxedFrame(bgColor: Color, radius: CGFloat) -> some View {
        self
            .foregroundColor(bgColor)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .strokeBorder(
                        style: StrokeStyle(
                            lineWidth: 2,
                            dash: [16]
                        )
                    )
                    .foregroundColor(bgColor)
                    .padding(.horizontal, 10)
            )
    }
}

struct BouncyButton: ButtonStyle {
    var color: LinearGradient
    var cornerRadius: CGFloat
    var shadowColor: Color
    var shadowOpacity: Double
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: shadowColor.opacity(shadowOpacity), radius: 15, x: 0, y: 15)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0), value: configuration.isPressed)
    }
}

