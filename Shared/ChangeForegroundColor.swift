//
//  ChangeForegroundColor.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 05.11.2021.
//

import SwiftUI

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
