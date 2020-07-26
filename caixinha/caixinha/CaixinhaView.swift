//
//  CaixinhaView.swift
//  caixinha
//
//  Created by Manuella Valença on 26/07/20.
//  Copyright © 2020 Manuella Valença. All rights reserved.
//

import SwiftUI

struct CaixinhaView: View {
    var body: some View {
        Section(header: Text("Explorar").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
            VStack(spacing: 10) {
                ForEach(User.shared.categories, id: \.self) { category in
                    HStack {
                        Spacer()
                        CategoryCellView(category: category)
                        Spacer()
                    }
                }
            }.padding()
        }
    }
}

struct CaixinhaView_Previews: PreviewProvider {
    static var previews: some View {
        CaixinhaView()
    }
}
