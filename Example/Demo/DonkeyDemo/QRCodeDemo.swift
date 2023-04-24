//
//  QRCodeDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct QRCodeDemo: View {
    @State var str: String = "hello"
    var body: some View {
        Form{
            TextField("str", text: $str)
            Image(uiImage:QRCode.createQRForString(self.str))
                .resizable()
                .scaledToFit()
        }
    }
}

struct QRCodeDemo_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeDemo()
    }
}
