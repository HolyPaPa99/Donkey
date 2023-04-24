//
//  CopyRightDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/21.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct ViewExtensionDemo: View {
    @State var theme: UIUserInterfaceStyle = .light
    var body: some View {
        Form {
            Picker("", selection: $theme, content: {
                Text("Dark")
                    .tag(UIUserInterfaceStyle.dark)
                Text("Light")
                    .tag(UIUserInterfaceStyle.light)
            })
            .pickerStyle(.segmented)
            HStack{
                Text("Hidden")
            }
            .hidden({true})
        }
        .copyRight("@All Rights Reserved.")
        .switchTheme(theme)
        .local(".zh_CN")
        .navigationBackButtonTitle(.constant("back"))
    }
}

struct ViewExtensionDemo_Previews: PreviewProvider {
    static var previews: some View {
        ViewExtensionDemo()
    }
}
