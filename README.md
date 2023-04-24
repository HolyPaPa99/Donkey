# Donkey

[![CI Status](https://img.shields.io/travis/Sean/Donkey.svg?style=flat)](https://travis-ci.org/Sean/Donkey)
[![Version](https://img.shields.io/cocoapods/v/Donkey.svg?style=flat)](https://cocoapods.org/pods/Donkey)
[![License](https://img.shields.io/cocoapods/l/Donkey.svg?style=flat)](https://cocoapods.org/pods/Donkey)
[![Platform](https://img.shields.io/cocoapods/p/Donkey.svg?style=flat)](https://cocoapods.org/pods/Donkey)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Donkey is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Donkey', :git => 'https://github.com/HolyPaPa99/Donkey.git', :tag => '0.1.0'
```

## Author

Sean, seanlee0v0@icloud.com

## License

Donkey is available under the MIT license. See the LICENSE file for more info.

## Components

### 1.NavigationStore
It's a gloable navigation store. It helps you to navigate views in your code.

* `push` a view into the navigation stack

```swift
import SwiftUI
import Donkey

struct NavigationDemo: View {
    @ObservedObject var navigation: NavigationStore = NavigationStore.Shared
    var body: some View {
        NavigationStack(path: $navigation.stack) {
            VStack{
                NavigationLink("ViewExtensionDemo", destination: {
                    ViewExtensionDemo()
                })
                Button{
                    navigation.push(Stack("FormDemo", {
                        FormDemo()
                    }))
                } label:{
                    Text("FormDemo")
                }
            }
            .navigationDestination(for: Stack.self, destination: {stack in
                stack.nextView
            })
        }
    }
}

```

* `popup` the last element from the navigation stack

```swift

Button{
	NavigationStore.Shared.popup()
} label: {
	Text("Back")
}

```


### 2.PageSlider

```swift
import SwiftUI
import Donkey

struct SliderDemo: View {
    @State var currentPage: Int = 0
    
    var body: some View {
        ZStack{
            PageSlider([
                AnyView(ViewExtensionDemo()),
                AnyView(DispatchTimerDemo()),
                AnyView(FormDemo()),
                AnyView(IPToolDemo()),
                AnyView(QRCodeDemo())
            ], $currentPage)
            .padding()
        }
        .background(Color.green)
    }
}

```




### 3.Form

```swift
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

```






