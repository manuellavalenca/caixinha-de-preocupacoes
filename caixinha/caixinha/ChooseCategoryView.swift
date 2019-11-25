//
//  ChooseCategoryView.swift
//  caixinha
//
//  Created by Manuella Valença on 22/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import Foundation
import SwiftUI

struct ChooseCategoryView: View {
    @Binding var currentCategory: String
    
    var body: some View {
        VStack(spacing: 5){
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    ForEach(0..<User.shared.categories.count) { index in
                        Button(action: {
                            self.currentCategory = User.shared.categories[index]
                            print("selected \(self.currentCategory)")
                        }) {
                            Text(User.shared.categories[index])
                        }.buttonStyle(CategoryButtonStyle())
                            .foregroundColor(self.currentCategory == User.shared.categories[index] ? Color.blue : Color.gray)
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}
