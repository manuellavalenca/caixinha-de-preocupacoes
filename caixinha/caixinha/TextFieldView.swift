//
//  TextView.swift
//  caixinha
//
//  Created by Manuella Valença on 12/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct TextFieldView: View {
    @Binding var currentText: String

    var body: some View {
        HStack {
            Spacer()
            TextField(" O que te preocupa?", text: $currentText)
                .font(fonts.largeFont)
                .foregroundColor(Color(colors.darkGray))
                .padding()
                .overlay(
                    Rectangle().fill(Color(colors.transparentDarkGray)).cornerRadius(20)
                    .frame(minHeight: 50)
            )
            Spacer()
        }
    }
}

//struct TextView: UIViewRepresentable {
//    @Binding var text: String
//
//    func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextView {
//        let view = UITextView()
//        view.isEditable = true
//        return UITextView()
//    }
//
//    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<Self>) {
//        text = uiView.text
////        print("oia o texto na view: \(String(describing: uiView.text))")
////        print("oia o texto na textview: \(self.text)")
//    }
//
//}
