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

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        print("OLHA: \(self.text)")
        User.shared.addNote(text: self.text, category: "trabalho")
    }
}
