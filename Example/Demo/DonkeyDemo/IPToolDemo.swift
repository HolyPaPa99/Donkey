//
//  IPToolDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey

struct IPToolDemo: View {
    @State var ipaddrs: [String] = []
    
    init(){
        let addrs = IPTools.getIPAddresses()
        guard addrs != nil else {
            return
        }
        for key  in addrs!.keys {
            ipaddrs.append("\(key):\(addrs![key] ?? "Empty")")
        }
    }
    var body: some View {
        if self.ipaddrs.count > 0 {
            List(self.ipaddrs, id: \.self){addr in
                Text("\(addr)")
            }
        } else {
            VStack {
                Text("No Addresses Found Here.")
            }
        }
    }
}

struct IPToolDemo_Previews: PreviewProvider {
    static var previews: some View {
        IPToolDemo()
    }
}
