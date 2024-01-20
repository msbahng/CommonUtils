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
            .padding(.top, MS.Sizes.Layout.verticalMargin)
            .padding(.bottom, MS.Sizes.Layout.verticalMargin)
    }
}

struct HeadlineModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
            .padding(.top, MS.Sizes.Layout.verticalMargin)
            .padding(.bottom, MS.Sizes.Layout.verticalMargin)
    }
}

struct SubHeadlineModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
            .padding(.top, MS.Sizes.Layout.verticalMargin)
            .padding(.bottom, MS.Sizes.Layout.verticalMargin)
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

struct ListCellHeaderModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .lineLimit(MS.Sizes.Layout.listCellTitleLines)
    }
}

struct ListCellDescriptionModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(Color.secondary)
            .lineLimit(MS.Sizes.Layout.listCellDescriptionLines)
    }
}


struct TagTextModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.all, 5)
            .font(.body)
            .background(Color(UIColor.systemFill))
            .foregroundColor(Color(UIColor.label))
            .cornerRadius(12)
    }
}

struct SignTextModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.all, 5)
            .font(.body)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
    }
}


struct MapAnnotationTextModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.all, 5)
            .font(.callout)
            .background(Color(UIColor.secondarySystemBackground))
            .foregroundColor(Color(UIColor.label))
            .cornerRadius(5)
    }
}


extension Text {
    public func itemTitle() -> some View {
        modifier(ItemTitleModifier())
    }
    
    public func headline() -> some View {
        modifier(HeadlineModifier())
    }
    
    public func subHeadline() -> some View {
        modifier(SubHeadlineModifier())
    }
    
    public func listTitle() -> some View {
        modifier(ListTitleModifier())
    }
    
    public func listCellHeader() -> some View {
        modifier(ListCellHeaderModifier())
    }
    
    public func listCellDescription() -> some View {
        modifier(ListCellDescriptionModifier())
    }
    
    public func tagText() -> some View {
        modifier(TagTextModifier())
    }
    
    public func signText() -> some View {
        modifier(SignTextModifier())
    }
    
    public func mapAnnotationText() -> some View {
        modifier(MapAnnotationTextModifier())
    }
}
