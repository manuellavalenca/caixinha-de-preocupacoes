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
    @FetchRequest(fetchRequest: NoteCD.getAllNotes()) var notes: FetchedResults<NoteCD>
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.lightBlue, .font: fonts.largeTitleCustom!]
        self.textAdded = ""
        //self.createUserCD()
        //self.updateCD()
    }
    
    var body: some View {
        NavigationView() {
            ScrollView {
                Spacer(minLength: 30)
                VStack(alignment: .leading, spacing: 10) {
                    Section(header: Text("Adicionar").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
                        VStack(spacing: 10) {
                            ChooseCategoryView(currentCategory: $categorySelected)
                            HStack {
                                TextFieldView(currentText: $textAdded)
                                Button(action: {
                                    if self.textAdded != "" {
                                        self.createNoteCD()
                                        //User.shared.addNote(text: self.textAdded, category: self.categorySelected)
                                    }
                                    self.textAdded = ""
                                }) {
                                    Text("guardar")
                                }.buttonStyle(AddButtonStyle())
                            }
                            ForEach(self.notes) { note in
                                Text(note.text!)
                            }
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
            .navigationBarTitle("Caixinha de preocupações", displayMode: .large).lineLimit(nil)
            .listStyle(GroupedListStyle())
            .padding()
        }
    }
    func createNoteCD() {
        let note = NoteCD(context: self.managedObjectContext)
        note.text = self.textAdded
        note.category = self.categorySelected
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
    }
    
//    func updateCD() {
//        print("Oia os users \(self.users)")
//    }
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
