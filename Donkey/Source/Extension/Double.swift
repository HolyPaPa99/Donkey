//
//  Double.swift
//  SpiderFit
//
//  Created by 李烨烽 on 2022/9/26.
//

import Foundation

extension Double {
    
    public func precisionString(_ afterDot: Int)-> String{
        return String(format: "%.\(afterDot)f", self)
    }
}
