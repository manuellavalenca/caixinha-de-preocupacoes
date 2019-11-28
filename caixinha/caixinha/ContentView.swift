//
//  ContentView.swift
//  caixinha
//
//  Created by Manuella Valença on 11/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import SwiftUI
import LocalAuthentication
import UIKit
import Combine

struct ContentView: View {
    @State private var textAdded = ""
    @State private var categorySelected = "trabalho"
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: NoteCD.entity(),
        sortDescriptors: []) var notes: FetchedResults<NoteCD>
    
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: colors.darkPink, .font: fonts.smallTitleCustom!]
        self.textAdded = ""
    }
    
    var body: some View {
        NavigationView() {
            ScrollView(showsIndicators: false) {
                Spacer(minLength: 30)
                VStack(alignment: .leading, spacing: 10) {
                    Section(header: Text("Adicionar").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
                        VStack(spacing: 20) {
                            ChooseCategoryView(currentCategory: $categorySelected)
                            TextFieldView(currentText: $textAdded)
                            Button(action: {
                                if self.textAdded != "" {
                                    self.createNoteCD()
                                }
                                self.textAdded = ""
                                UIApplication.shared.endEditing()
                            }) {
                                Text("guardar")
                            }.buttonStyle(AddButtonStyle())
                        }
                    }.padding(.horizontal)
                    
                    Section(header: Text("Explorar").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
                        ScrollView (.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(User.shared.categories, id: \.self) { category in
                                    HStack {
                                        Spacer()
                                        CategoryCellView(category: category)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }.padding()
                }
            }
            .navigationBarTitle("Caixinha", displayMode: .inline)
            //.padding()
        }
    }
    func createNoteCD() {
        let note = NoteCD(context: self.managedObjectContext)
        note.configure(category: self.categorySelected, text: self.textAdded)
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
