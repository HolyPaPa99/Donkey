//
//  NavigationStore.swift
//  Spider-IOS
//
//  Created by 李烨烽 on 2022/9/23.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
public class NavigationStore: ObservableObject {
    
    public static let Shared: NavigationStore = NavigationStore()
    
    @Published public var stack: NavigationPath = NavigationPath()
    
    private init(){}
    
    public func popup(){
        self.stack.removeLast()
    }
    
    public func push(_ value: any Hashable){
        self.stack.append(value)
    }
}
