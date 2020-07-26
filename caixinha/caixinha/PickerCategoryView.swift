//
//  ChooseCategoryView.swift
//  caixinha
//
//  Created by Manuella Valença on 22/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct PickerCategoryView: View {
    @Binding var currentIndex: Int
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: CategoryCD.getAllCategories()) var categoriesCD: FetchedResults<CategoryCD>
    
    init(index: Binding<Int>) {
        self._currentIndex = index
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: colors.darkGray, .font: fonts.smallerTitleCustom!], for: .normal)
    }
    
    var body: some View {
        VStack{
            //Form {
            Section {
                Picker(selection: $currentIndex, label:
                    Text("Categoria"), content: {
                        ForEach(0..<User.shared.categories.count){ index in
                            Text(User.shared.categories[index]).tag(index)
                        }
                    }
                ).font(fonts.captionCustom)
                    .pickerStyle(SegmentedPickerStyle())
                    .foregroundColor(Color(colors.darkGray))
            }
        }
    }
}
