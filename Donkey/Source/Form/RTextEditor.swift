//
//  RTextEditor.swift
//  Spider-IOS
//
//  Created by cap on 2022/6/4.
//

import SwiftUI

public struct RTextEditor: View {
    var value: String
    var name: String
    var onChange: (_ newValue: String)-> Void
    var unit: String
    
    public init(_ name: String, _ value: String, _ onChange: @escaping (_ newValue: String)-> Void, _ unit: String){
        self.name = name
        self.value = value
        self.onChange = onChange
        self.unit = unit
    }
    
    struct FieldView: View {
        @Environment(\.dismiss) private var dismiss
        var name: String
        @State var value: String
        
        var done: (_ newValue:String)->Void
        
        var body: some View {
            Form {
                TextEditor(text: $value)
                    .frame(height:100)
            }
            .navigationTitle(Text(LocalizedStringKey(name)))
            .navigationBarItems(trailing:
                Button(action: {
                    done(value)
                    dismiss()
                }){
                    Text(LocalizedStringKey("Done"))
                        .fontWeight(.heavy)
                }
            )
        }
    }
    public var body: some View {
        NavigationLink(destination: FieldView(name: name, value:value, done: onChange)){
            HStack{
                Text(LocalizedStringKey(name))
                Spacer()
                Text("\(value)")
                    .foregroundColor(.secondary)
                Text(LocalizedStringKey(unit))
                    .foregroundColor(.secondary)
            }
        }
    }
}


