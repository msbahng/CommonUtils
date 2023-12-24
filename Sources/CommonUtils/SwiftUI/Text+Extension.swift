//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI

struct ItemTitleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
    }
}

struct ListTitleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
    }
}


struct TagTextModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.all, 5)
            .font(.body)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(12)
    }
}

struct MapAnnotationTextModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.all, 5)
            .font(.callout)
            .background(Color.white)
            .foregroundColor(Color.blue)
            .cornerRadius(5)
    }
}


extension Text {
    public func itemTitle() -> some View {
        modifier(ItemTitleModifier())
    }
    
    public func listTitle() -> some View {
        modifier(ListTitleModifier())
    }
    
    public func tagText() -> some View {
        modifier(TagTextModifier())
    }
    
    public func mapAnnotationText() -> some View {
        modifier(MapAnnotationTextModifier())
    }
}
