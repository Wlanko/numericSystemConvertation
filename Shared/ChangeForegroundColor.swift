//
//  ChangeForegroundColor.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 05.11.2021.
//

import SwiftUI

struct ChangeForegroundColor: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        return content.foregroundColor(color)
    }
}

extension View {
    func changeTextFieldForegroundColor(color: Color) -> some View {
        self.modifier(ChangeForegroundColor(color: color))
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
