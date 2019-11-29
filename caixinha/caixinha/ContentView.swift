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
    @State private var indexCategorySelected = 0
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: NoteCD.entity(),
        sortDescriptors: []) var notes: FetchedResults<NoteCD>
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.darkPink, .font: fonts.largeTitleCustom!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: colors.darkPink, .font: fonts.smallTitleCustom!]
        UITableView.appearance().separatorColor = UIColor.clear
        UITableView.appearance().backgroundColor = UIColor.clear
        self.textAdded = ""
    }
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Section {
                        VStack(spacing: 20) {
                            TextFieldView(currentText: $textAdded)
                            ChooseCategoryView(index: $indexCategorySelected)
                            Button(action: {
                                if self.textAdded != "" {
                                    self.createNoteCD()
                                }
                                self.textAdded = ""
                                UIApplication.shared.endEditing()
                            }) {
                                Text("guardar")
                            }.buttonStyle(AddButtonStyle())
                        }.padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                    }
                    
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
                    }//.padding()
                }.padding()
                }
            .navigationBarTitle("Caixinha", displayMode: .inline)
        }.background(Color.green)
    }
    func createNoteCD() {
        let note = NoteCD(context: self.managedObjectContext)
        note.configure(category: User.shared.categories[self.indexCategorySelected], text: self.textAdded)
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
