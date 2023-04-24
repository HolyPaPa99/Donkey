//
//  DateExtensionDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct DateExtensionDemo: View {
    var body: some View {
        VStack{
            Text("start day of this week: \(Date.startOfThisWeek().formatted())")
            Text("end day of this week: \(Date.endOfThisWeek().formatted())")
            Text("three days ago:\(Date().date(byAddingDays: -3).formatted())")
            Button{
                NavigationStore.Shared.popup()
            } label: {
                Text("返回")
            }
        }
    }
}

struct DateExtensionDemo_Previews: PreviewProvider {
    static var previews: some View {
        DateExtensionDemo()
    }
}
