//
//  CommonStack.swift
//  SpiderFit
//
//  Created by 李烨烽 on 2022/9/28.
//

import Foundation
import SwiftUI

public struct Stack: Hashable {
    public static func == (lhs: Stack, rhs: Stack) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public var id: String
    public var nextView: AnyView
    
    public init(_ id: String, _ nextView: @escaping ()-> some View){
        self.id = id
        self.nextView = AnyView(nextView())
    }
}
