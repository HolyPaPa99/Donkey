/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view wrapping a UIPageControl.
*/

import SwiftUI
import UIKit

public struct PageControl: UIViewRepresentable {
    public var numberOfPages: Int
    @Binding public var currentPage: Int

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }

    public func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    public class Coordinator: NSObject {
        public var control: PageControl

        public init(_ control: PageControl) {
            self.control = control
        }

        @objc
        public func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

