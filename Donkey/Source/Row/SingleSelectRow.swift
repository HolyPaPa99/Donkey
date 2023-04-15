//
//  SingleSelectRow.swift
//  Spider-IOS
//
//  Created by Rex on 2021/6/29.
//

import SwiftUI

public struct SingleSelectRow<T: Equatable>: View {
    var value: T
    var text: String
    var selected: Binding<T>
    
    public init(value:T, text:String, selected:Binding<T>){
        self.value = value
        self.text = text
        self.selected = selected
    }
    
    public var body: some View {
        HStack{
            Text(LocalizedStringKey(text))
            Spacer()
            if value == selected.wrappedValue {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: {
            self.selected.wrappedValue = self.value
        })
    }
}
