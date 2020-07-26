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
            TextField("Desabafa aqui!", text: $currentText)
                .font(fonts.largeFont)
                .foregroundColor(Color(colors.darkGray))
                .padding()
                .accentColor(Color(colors.babyPink))
                .background(Color(colors.transparentDarkGray))
                .cornerRadius(20)
            Spacer()
        }
    }
}
