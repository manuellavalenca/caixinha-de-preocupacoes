//
//  CategoryCellView.swift
//  caixinha
//
//  Created by Manuella Valença on 13/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct CategoryCellView: View {
    var category: String
    
    init (category: String) {
        self.category = category
    }
    var body: some View {
        ZStack {
            Rectangle().fill(Color(colors.lightBlue)).cornerRadius(20)
            .frame(width: 300.0, height: 250.0, alignment: .center)
            NavigationLink(destination: ListView(category: category)){
                Text(self.category)
            }.font(fonts.headlineCustom).foregroundColor(Color.white)
        }
    }
}
