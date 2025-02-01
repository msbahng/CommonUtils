//
//  Toast.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/02/05.
//

import SwiftUI

public struct Toast: View {
    public var title: String
    public var backgroundColor: Color?
    public var titleColor: Color?
    @Binding public var isShown: Bool

    public var body: some View {
        
        VStack {
            Spacer()
            
            Text(title)
                .font(.body)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(titleColor ?? Color.primary)
                .background(backgroundColor ?? Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(20)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.isShown = false
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isShown = false
                }
            }
        }
    }
}

public extension View {
    @ViewBuilder
    public func toast(
        _ toastMessage: String,
        backgroundColor: Color? = nil,
        titleColor: Color? = nil,
        isShowToast: Binding<Bool>
    ) -> some View {
        self.modifier(
            Overlay(
                isShown: isShowToast,
                overlayView: Toast(
                    title: toastMessage,
                    backgroundColor: backgroundColor,
                    titleColor: titleColor,
                    isShown: isShowToast
                )
            )
        )
    }
}

#Preview {
    Toast(title: "test", isShown: .constant(true))
}
