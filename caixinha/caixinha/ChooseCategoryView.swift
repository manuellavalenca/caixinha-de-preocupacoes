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
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: CategoryCD.getAllCategories()) var categoriesCD: FetchedResults<CategoryCD>
    var allCategories: [String] = ["trabalho", "relacionamentos", "saúde"]
    
    var body: some View {
        VStack(spacing: 5) {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    //                    ForEach(0..<self.categoriesCD.count) { index in
                    //                        self.allCategories.append(self.categoriesCD[index].name!)
                    //                    }
                    ForEach(0..<self.allCategories.count) { index in
                        Spacer()
                        Button(action: {
                            self.currentCategory = self.allCategories[index]
                            print("selected \(self.currentCategory)")
                        }) {
                            Text(self.allCategories[index])
                        }.buttonStyle(CategoryButtonStyle())
                            .foregroundColor(self.currentCategory == self.allCategories[index] ? Color.blue : Color.gray)
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}
