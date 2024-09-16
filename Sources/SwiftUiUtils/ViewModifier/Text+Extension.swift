//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI
import CommonUtils

struct LargeTitleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
            .padding(.top, MS.Sizes.Layout.verticalMargin)
            .padding(.bottom, MS.Sizes.Layout.verticalMargin)
    }
}

struct LargeDescriptionModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
            .padding(.top, MS.Sizes.Layout.verticalMargin)
            .padding(.bottom, MS.Sizes.Layout.verticalMargin)
    }
}


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

struct ListCellTitleModifier: ViewModifier {
    
    var isSmall: Bool
    
    public func body(content: Content) -> some View {
        content
            .font(isSmall ? .callout : .body)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.primary)
            .lineLimit(isSmall ? MS.Sizes.Layout.listCellTitleLinesSmall : MS.Sizes.Layout.listCellTitleLines)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
    }
}

struct ListCellDescriptionModifier: ViewModifier {
    
    var isSmall: Bool
    
    public func body(content: Content) -> some View {
        content
            .font(isSmall ? .callout : .body)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.secondary)
            .lineLimit(isSmall ? MS.Sizes.Layout.listCellDescriptionLinesSmall : MS.Sizes.Layout.listCellDescriptionLines)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
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

struct RightAlignSmallModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(Color(UIColor.label))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
    }
}


extension Text {
    public func largeTitle() -> some View {
        modifier(LargeTitleModifier())
    }
    
    public func largeDescription() -> some View {
        modifier(LargeDescriptionModifier())
    }
    
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
    
    public func listCellTitle(isSmall: Bool? = false) -> some View {
        modifier(ListCellTitleModifier(isSmall: isSmall ?? false))
    }
    
    public func listCellDescription(isSmall: Bool? = false) -> some View {
        modifier(ListCellDescriptionModifier(isSmall: isSmall ?? false))
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
    
    public func rightAlignSmallText() -> some View {
        modifier(RightAlignSmallModifier())
    }
}
