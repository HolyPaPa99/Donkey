//
//  Iconfont.swift
//  Introspect
//
//  Created by Rex on 2021/6/5.
//

import SwiftUI

@available(iOS 14.0.0, *)
public struct Iconfont: View {
    
    public static var ttfName: String = "iconfont"
    private var icon: String
    private var color: Color = .secondary
    private var size: CGFloat = 26
    
    public init(_ icon: String){
        self.icon = icon
    }
    public init(_ icon: String, _ color: Color, _ size: CGFloat){
        self.icon = icon
        self.color = color
        self.size = size
    }
    public func toUIImage()-> UIImage{
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: "iconfont", size: self.size)
        label.textAlignment = .center
        label.text = self.icon
        label.sizeToFit()
        label.textColor = UIColor(self.color)
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    public var body: some View {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: Iconfont.ttfName, size: self.size)
        label.textAlignment = .center
        label.text = self.icon
        label.sizeToFit()
        label.textColor = UIColor(self.color)
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return Image(uiImage: img!)
    }
    
    public func size(_ size: CGFloat)-> Iconfont{
        return Iconfont(self.icon, self.color, size)
    }
    
    public func color(_ color: Color)-> Iconfont{
        return Iconfont(self.icon, color, self.size)
    }
}

@available(iOS 14.0.0, *)
struct Iconfont_Previews: PreviewProvider {
    static var previews: some View {
        Iconfont("\u{e631}")
    }
}
