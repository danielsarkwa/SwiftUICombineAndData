//
//  Extensions.swift
//  SwiftUICombineAndData
//
//  Created by Daniel Yeboah on 21.4.2023.
//

import SwiftUI

extension View {
    func angularGradientGlow(colors: [Color]) -> some View {
        self.overlay(
            AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .degrees(0.0))
                .mask(self)
        )
    }
    
    func linearGradientBackground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask(self)
        )
    }
    
    func blurBackground() -> some View {
        self
            .padding(16)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), lineWidth: 1)
                        .blendMode(.overlay)
            )
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // data from firebase
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy") // our format template
        return dateFormatter.string(from: self)
    }
}
