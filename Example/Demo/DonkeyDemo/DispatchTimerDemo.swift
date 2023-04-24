//
//  DispatchTimerDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct DispatchTimerDemo: View {
    @State var countDown: Int  = 60
    
    var body: some View {
        VStack {
            Text("\(countDown)")
                .font(.largeTitle)
        }
        .task{
            _ = DispatchSource.dispatchTimer(timeInterval: 1, handler: {timer in
                countDown -= 1
                if countDown <= 0 {
                    timer?.cancel()
                }
            }, needRepeat: true)
        }
    }
}

struct DispatchTimerDemo_Previews: PreviewProvider {
    static var previews: some View {
        DispatchTimerDemo()
    }
}
