
@available(iOS 15.0, *)
struct Validation: ViewModifier {
    
    var valid:()->ValidateResult
    
    @State var isBlur:Bool = false
    @FocusState var focus:Bool
    
    func body(content: Content) -> some View {
        VStack{
            content
            if isBlur {
                if let result = valid() {
                    if result.status == .invalid{
                        Divider()
                        HStack{
                            Text("\(result.errMsg)")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                }
            }
        }
        .focused($focus)
        .onChange(of: focus){newValue in
            if !newValue {
                isBlur = true
            } else {
                isBlur = false
            }
        }
    }
}
