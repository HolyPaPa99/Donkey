//
//OptimizedIntStepper
//Created by Rex on 2021/10/08.
//

import SwiftUI

@available(iOS 15.0, *)
public struct OptimizedIntStepper: View {
    
    var label:Text
    var range: ClosedRange<Int>
    var step: Int
    var value: Binding<Int>
    
    @State private var text:String
    @FocusState private var focus: Bool
    
    public init(_ label:Text, _ value:Binding<Int>, range: ClosedRange<Int>, step:Int){
        self.label = label
        self.range = range
        self.step = step
        self.value = value
        self.text = String(value.wrappedValue)
    }
    
    public var body: some View{
        Stepper(value: self.value, in: self.range, step:self.step, label: {
            HStack{
                self.label
                    .foregroundColor(.secondary)
                Spacer()
                TextField("",text: $text, prompt: self.label)
                    .padding(.trailing, 10)
                    .focused($focus)
                    .multilineTextAlignment(.trailing)
                    .onSubmit {
                        let newValue = NSString(string: text).integerValue
                        if self.range.contains(newValue) {
                            self.value.wrappedValue = newValue
                        }
                    }
                    .onChange(of: focus){ newValue in
                        if !newValue {
                            self.text = String(self.value.wrappedValue)
                        }
                    }
                
            }
            .onChange(of: value.wrappedValue){ newValue in
                self.text = String(newValue)
            }
        })
    }
}
