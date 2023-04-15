//
//  RPicker.swift
//  Spider-IOS
//
//  Created by Rex on 2021/6/28.
//

import SwiftUI

@available(iOS 14.0, *)
public struct RPicker<T: Hashable>: View {
    public struct Item: Hashable{
        public var value: T
        public var text: String
        public init(_ value: T, _ text: String){
            self.value = value
            self.text = text
        }
    }
    public enum Style {
        case Default
        case Wheel
    }
    var label: String
    var data: [Item]
    var selected: T
    var done: (_ newValue: T)-> Void
    var style: Style
    var unit: String
    
    public static func instance(_ label: String, data: [Item], selected: T, _ done: @escaping (_ newValue: T)->Void, _ pickerStyle: Style, _ unit: String)-> RPicker{
        return RPicker(label: label, data: data, selected: selected, done: done, style: pickerStyle, unit: unit)
    }
    
    struct StackView: View{
        @Environment(\.dismiss) private var dismiss
        var label: String
        var data: [Item]
        @State var selected: T
        var done: (_ value: T)-> Void
        var style: Style
        var body: some View{
            if style == .Wheel {
                List{
                    Picker("", selection: $selected){
                        ForEach(data, id: \.text){item in
                            Text(LocalizedStringKey(item.text))
                                .tag(item.value)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                .navigationTitle(LocalizedStringKey(label))
                .navigationBarItems(trailing: Button(action: {
                    done(selected)
                    dismiss()
                }){
                    Text(LocalizedStringKey("Done"))
                        .fontWeight(.heavy)
                })
            } else {
                List(data, id:\.text){
                    SingleSelectRow(value: $0.value, text: $0.text, selected: $selected)
                }
                .navigationTitle(LocalizedStringKey(label))
                .navigationBarItems(trailing: Button(action: {
                    done(selected)
                    dismiss()
                }){
                    Text(LocalizedStringKey("Done"))
                        .fontWeight(.heavy)
                })
            }
        }
    }
    public var body: some View {
        NavigationLink(destination: StackView(label: label, data: data
                                              , selected:selected, done: done, style: style)){
            HStack {
                Text(LocalizedStringKey(label))
                Spacer()
                ForEach(data, id:\.text){ item in
                    if item.value == selected {
                        Text(LocalizedStringKey(item.text))
                            .foregroundColor(.secondary)
                    }
                }
                Text(LocalizedStringKey(unit))
                    .foregroundColor(.secondary)
            }
        }
    }
}


