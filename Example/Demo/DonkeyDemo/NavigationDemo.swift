//
//  NavigationDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct NavigationDemo: View {
    @ObservedObject var navigation: NavigationStore = NavigationStore.Shared
    var body: some View {
        NavigationStack(path: $navigation.stack) {
            VStack{
                NavigationLink("ViewExtensionDemo", destination: {
                    ViewExtensionDemo()
                })
                Button{
                    navigation.push(Stack("DateExtensionDemo", {
                        DateExtensionDemo()
                    }))
                } label:{
                    Text("DateExtensionDemo")
                }
                Button{
                    navigation.push(Stack("DispatchTimerDemo", {
                        DispatchTimerDemo()
                    }))
                } label:{
                    Text("DispatchTimerDemo")
                }
                Button{
                    navigation.push(Stack("FormDemo", {
                        FormDemo()
                    }))
                } label:{
                    Text("FormDemo")
                }
                Button{
                    navigation.push(Stack("IPToolDemo", {
                        IPToolDemo()
                    }))
                } label:{
                    Text("IPToolDemo")
                }
                NavigationLink("QRCodeDemo", destination: {
                    QRCodeDemo()
                })
                NavigationLink("SliderDemo", destination: {
                    SliderDemo()
                })
            }
            .navigationBackButtonTitle(.constant("返回"))
            .navigationDestination(for: Stack.self, destination: {stack in
                stack.nextView
            })
        }
    }
}

struct NavigationDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDemo()
    }
}
