//
//  FormDemo.swift
//  Demo
//
//  Created by 李烨烽 on 2023/4/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import Donkey
import PhotosUI
enum Option: Hashable {
    case Option1, Option2, Option3
    
    static func toItems()-> [RPicker<Option>.Item]{
        return [
            RPicker<Option>.Item(.Option1, "Option1"),
            RPicker<Option>.Item(.Option2, "Option2"),
            RPicker<Option>.Item(.Option3, "Option3")
        ]
    }
}

struct FormDemo: View {
    @State var text: String = ""
    @State var intValue: Int = 0
    @State var doubleValue: Double = 0
    @State var textEdit: String = ""
    @State var rpicker: Option = .Option1
    @State var image: UIImage?
    var body: some View {
        Form{
            TextField("input", text: $text)
                .validation({
                    return .invalid("error")
                })
            OptimizedIntStepper(Text("value"), $intValue, range: 0...10, step: 1)
            OptimizedDoubleStepper(Text("double value"), $doubleValue, range: 0...10, step: 1, precision: 2)
            RTextEditor("text edit", textEdit, {value in
                textEdit = value
            }, "")
            RPicker.instance("RPicker", data: Option.toItems(), selected: rpicker, {newValue in
                rpicker = newValue
            }, .Default, "")
            UIImagePicker("Choose a Image", {image in
                self.image = image
            })
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
            }
        }
    }
}

struct FormDemo_Previews: PreviewProvider {
    static var previews: some View {
        FormDemo()
    }
}
