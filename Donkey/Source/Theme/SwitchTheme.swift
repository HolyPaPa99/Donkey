//
//  SwitchTheme.swift
//  Pods-SwiftUIRex_Tests
//
//  Created by Rex Lee on 2021/4/11.
//

import SwiftUI
import Introspect

struct SwitchTheme: ViewModifier {
    var theme: UIUserInterfaceStyle
    
    func body(content: Content)-> some View {
        content.introspectViewController(customize: {viewController in
            viewController.overrideUserInterfaceStyle = theme
        })
    }
}
