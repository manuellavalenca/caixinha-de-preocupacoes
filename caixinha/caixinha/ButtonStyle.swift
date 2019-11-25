//
//  ButtonStyle.swift
//  caixinha
//
//  Created by Manuella Valença on 11/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct CategoryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(fonts.captionCustom)
    }
}

struct AddButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.gray : Color(colors.lightBlue))
            .font(fonts.captionCustom)
    }
}
