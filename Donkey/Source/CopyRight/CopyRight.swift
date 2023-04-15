//
//  CopyRight.swift
//  Pods-SwiftUIRex_Tests
//
//  Created by Rex Lee on 2021/4/11.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct CopyRightModifier: ViewModifier {
    var copyRight: String
    
    func body(content: Content) -> some View {
        content.overlay(Text(self.copyRight)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        , alignment: .bottom)
    }
}
