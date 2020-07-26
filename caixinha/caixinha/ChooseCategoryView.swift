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
            //}.frame(maxHeight: 100)
        }
        
        //        VStack(spacing: 5) {
        //            ScrollView(.horizontal, showsIndicators: false){
        //                HStack {
        //                            Picker(selection: $currentIndex, label:
        //                                Text(""), content: {
        //                                    ForEach(0..<User.shared.categories.count){ index in
        //                                        Text(User.shared.categories[index]).tag(index)
        //                                    }
        //                                })
        
        //                    ForEach(0..<self.allCategories.count) { index in
        //                        Spacer()
        //                        Button(action: {
        //                            self.currentCategory = self.allCategories[index]
        //                            print("selected \(self.currentCategory)")
        //                        }) {
        //                            Text(self.allCategories[index])
        //                        }.buttonStyle(CategoryButtonStyle())
        //                            .foregroundColor(self.currentCategory == self.allCategories[index] ? Color(colors.darkPink) : Color.gray)
        //                    }
        //                }.padding()
        //}
        //}
    }
}
