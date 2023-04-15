//
//  View.swift
//  Pods-SwiftUIRex_Tests
//
//  Created by Rex Lee on 2021/4/11.
//


@available(iOS 15.0, *)
public extension View{
    func copyRight(_ copyRight: String)-> some View {
        modifier(CopyRightModifier(copyRight: copyRight))
    }
    func switchTheme(_ theme: UIUserInterfaceStyle)-> some View {
        modifier(SwitchTheme(theme: theme))
    }
    func local(_ identifier: String)-> some View {
        modifier(LocalLanguage(identifier: identifier))
    }
    func navigationBackButtonTitle(_ title: Binding<String>)-> some View {
        modifier(BackButtonTitle(title: title))
    }
    func hidden(_ condition: @escaping ()->Bool)-> some View {
        modifier(HiddenModifier(condition: condition))
    }
    func validation(_ valid:@escaping ()->ValidateResult) -> some View{
        modifier(Validation(valid: valid))
    }
}
