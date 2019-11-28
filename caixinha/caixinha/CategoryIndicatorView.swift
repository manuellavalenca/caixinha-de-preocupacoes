//
//  CategoryIndicatorView.swift
//  caixinha
//
//  Created by Manuella Valença on 13/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct CategoryIndicatorView: View {
    var body: some View {
        Rectangle().fill(Color(colors.pink)).cornerRadius(20)
        .frame(width: 25.0, height: 2.0, alignment: .center)
    }
}
