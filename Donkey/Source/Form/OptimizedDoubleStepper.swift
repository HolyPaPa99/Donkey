//
//OptimizedIntStepper
//Created by Rex on 2021/10/08.
//

import SwiftUI

@available(iOS 15.0, *)
public struct OptimizedDoubleStepper: View {
    
    var label:Text
    var range: ClosedRange<Double>
    var step: Double
    var value: Binding<Double>
    var precision: Int
    
    @State private var text:String
    @FocusState private var focus: Bool
    
    public init(_ label:Text, _ value:Binding<Double>, range: ClosedRange<Double>, step:Double, precision: Int){
        self.label = label
        self.range = range
        self.step = step
        self.value = value
        self.precision = precision
        self.text = value.wrappedValue.precisionString(precision)
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
                        let newValue = NSString(string: text).doubleValue
                        if self.range.contains(newValue) {
                            self.value.wrappedValue = newValue
                        }
                    }
                    .onChange(of: focus){ newValue in
                        if !newValue {
                            self.text = self.value.wrappedValue.precisionString(self.precision)
                        }
                    }
                
            }
            .onChange(of: value.wrappedValue){ newValue in
                self.text = newValue.precisionString(self.precision)
            }
        })
    }
}
