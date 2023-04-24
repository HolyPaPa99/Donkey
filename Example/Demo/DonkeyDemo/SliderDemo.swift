//
//  SliderDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct SliderDemo: View {
    @State var currentPage: Int = 0
    
    var body: some View {
        ZStack{
            PageSlider([
                AnyView(ViewExtensionDemo()),
                AnyView(DispatchTimerDemo()),
                AnyView(FormDemo()),
                AnyView(IPToolDemo()),
                AnyView(QRCodeDemo())
            ], $currentPage)
            .padding()
        }
        .background(Color.green)
    }
}

struct SliderDemo_Previews: PreviewProvider {
    static var previews: some View {
        SliderDemo()
    }
}
