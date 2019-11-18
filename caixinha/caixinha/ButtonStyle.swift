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
            .foregroundColor(configuration.isPressed ? Color(colors.lightBlue): Color.gray)
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

//struct AddButtonStyle: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        ZStack{
//            Circle().stroke(Color(colors.lightBlue), lineWidth: 2).frame(width: 250, height: 125)
//            Rectangle()
//            .fill(Color(colors.lightBlue))
//            .frame(width: 70, height: 10)
//            Rectangle()
//            .fill(Color(colors.lightBlue))
//            .frame(width: 10, height: 70)
//        }
//        configuration.label
//            .foregroundColor(configuration.isPressed ? Color.gray : Color(colors.lightBlue))
//            .font(fonts.captionCustom)
//    }
//}
