//
//  LocalLanguage.swift
//  SwiftUIRex
//
//  Created by Rex Lee on 2021/4/11.
//

import SwiftUI

struct LocalLanguage: ViewModifier {
    var identifier: String
    func body(content: Content) -> some View {
        content.environment(\.locale, Locale(identifier: identifier))
    }
}
