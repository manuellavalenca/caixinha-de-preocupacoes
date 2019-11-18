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
            NavigationLink(destination: ListView(category: category)){
                ZStack {
                    Rectangle().fill(Color(colors.lightBlue)).cornerRadius(20)
                .frame(width: 350.0, height: 200.0, alignment: .center)
                    Text(self.category)
                }
            }.font(fonts.headlineCustom).foregroundColor(Color.white)
        }
    }
}
