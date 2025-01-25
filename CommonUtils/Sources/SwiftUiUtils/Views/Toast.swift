//
//  Toast.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/02/05.
//

import SwiftUI

public struct Toast: View {

    public var title: String
    @Binding public var isShown: Bool

    public init(title: String, isShown: Binding<Bool>) {
        self.title = title
        _isShown = isShown
    }
    
    public var body: some View {
        
        VStack {
            Spacer()
            
            Text(title)
                .font(.body)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(UIColor.secondarySystemBackground))
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

#Preview {
    Toast(title: "test", isShown: .constant(true))
}
