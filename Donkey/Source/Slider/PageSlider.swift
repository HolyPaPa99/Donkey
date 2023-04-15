/*
 PageSlider.swift
 author: Sean Lee
 */

import SwiftUI

public struct PageSlider<Page: View>: View {
    public var pages: [Page]
    public var currentPage:Binding<Int>
    
    public init(_ pages: [Page], _ currentPage: Binding<Int>){
        self.pages = pages
        self.currentPage = currentPage
    }
    
    public var body: some View {
        PageViewController(pages: pages, currentPage: currentPage)
            .overlay(alignment: .bottom){
                PageControl(numberOfPages: pages.count, currentPage: currentPage)
                    .frame(width: CGFloat(pages.count * 18))
                    .padding()
            }
    }
}


