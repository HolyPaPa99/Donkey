//
//  SwitchTheme.swift
//  Pods-SwiftUIRex_Tests
//
//  Created by Rex Lee on 2021/7/2.
//

import SwiftUI

struct HiddenModifier: ViewModifier {
    var condition: ()-> Bool
    
    func body(content: Content)-> some View {
        if !condition() {
            content
        } else {
            content.hidden()
        }
    }
}
