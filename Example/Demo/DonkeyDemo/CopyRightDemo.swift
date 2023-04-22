//
//  CopyRightDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/21.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct CopyRightDemo: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Spacer()
        }
        .copyRight("@All Rights Reserved.")
    }
}

struct CopyRightDemo_Previews: PreviewProvider {
    static var previews: some View {
        CopyRightDemo()
    }
}
