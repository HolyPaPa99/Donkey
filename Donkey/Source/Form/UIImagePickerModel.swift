//
//  QRCode.swift
//  Spider-IOS
//
//  Created by 李烨烽 on 2022/9/22.
//
import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
public class UIImagePickerModel: ObservableObject {
    @Published public var pickerItem: PhotosPickerItem? {
        didSet{
            pickerItem?.loadTransferable(type: Data.self){ result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data?):
                        self.uiImage = UIImage(data: data)!
                    case .success(nil):
                        debugPrint("no photo selected.")
                    case .failure(let error):
                        debugPrint(error)
                        
                    }
                }
            }
        }
    }
    @Published public var uiImage: UIImage?
}
