//
//  BackButtonTitle.swift
//  SwiftUIRex
//
//  Created by Rex Lee on 2021/4/11.
//

import SwiftUI

struct BackButtonTitle: ViewModifier{
    @Binding var title:String
    func body(content: Content) -> some View {
        content.introspectViewController(customize: {vc in
            vc.navigationItem.backButtonTitle = title
        })
    }
}
