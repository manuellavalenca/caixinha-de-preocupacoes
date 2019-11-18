//
//  AddButtonView.swift
//  caixinha
//
//  Created by Manuella Valença on 18/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct AddButtonView: View {
    @State var textAdded: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State var categorySelected = "trabalho"
    
    var body: some View {
        VStack{
            HStack() {
                Spacer()
                ForEach(User.shared.categories, id: \.self) { category in
                    Button(action: {
                        self.categorySelected = category
                        print("selected \(self.categorySelected)")
                    }) {
                        Text(category)
                    }.buttonStyle(CategoryButtonStyle())
                }
                Spacer()
            }
            CategoryIndicatorView()
            VStack {
                HStack {
                    Spacer()
                    TextView(text: $textAdded)
                        .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: .infinity)
                        .border(Color(colors.lightBlue), width: 2.0)
                        .statusBar(hidden: true)
                        .cornerRadius(20)
                        .font(fonts.headlineCustom)
                        .foregroundColor(Color(colors.darkGray))
                    Spacer()
                }
                Button(action: {
                    self.addNote()
                }) {
                    Text("adicionar bilhete")
                }.buttonStyle(AddButtonStyle())
            }
        }
    }
    
    func addNote() {
        self.presentationMode.wrappedValue.dismiss()
    }
}
