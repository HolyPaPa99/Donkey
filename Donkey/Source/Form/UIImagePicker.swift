//
//  ImagePicker.swift
//  Spider-IOS
//
//  Created by 李烨烽 on 2022/9/21.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
public struct UIImagePicker: View {
    
    var title: String
    var callback: (_ image: UIImage)->Void
    @State var selectedPhoto: PhotosPickerItem?
    
    public init(_ title: String, _ callback: @escaping (_ image: UIImage)->Void){
        self.title = title
        self.callback = callback
    }
    
    public var body: some View {
        PhotosPicker(LocalizedStringKey(title),selection: $selectedPhoto, matching: .images)
            .onChange(of: selectedPhoto, perform: {newValue in
                if newValue != nil {
                    newValue?.loadTransferable(type: Data.self){ result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let data?):
                                self.callback(UIImage(data: data)!)
                            case .success(nil):
                                debugPrint("no photo selected.")
                            case .failure(let error):
                                debugPrint(error)                        }
                            
                        }
                    }
                }
            })
            .onTapGesture {
                PHPhotoLibrary.requestAuthorization({_ in })
            }
//            .onAppear {
//                PHPhotoLibrary.requestAuthorization({_ in })
//            }
    }
}

