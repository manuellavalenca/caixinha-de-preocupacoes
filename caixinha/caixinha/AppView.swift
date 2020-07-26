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

struct AppView: View {
    @State private var textAdded = ""
    @State private var showAlert = false
    @State private var indexCategorySelected = 0
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: NoteCD.entity(),
        sortDescriptors: []) var notes: FetchedResults<NoteCD>
    var alert: Alert {
        Alert(title: Text("Bilhete adicionado!"), message: Text("Sua preocupação foi guardada na caixinha"), dismissButton: .default(Text("Ok")))
    }
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.darkPink, .font: fonts.largeTitleCustom!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: colors.darkPink, .font: fonts.smallTitleCustom!]
        UITableView.appearance().separatorColor = UIColor.clear
        UITableView.appearance().backgroundColor = UIColor.clear
        self.textAdded = ""
    }
    
    var body: some View {
            NavigationView {
                TabView {
                    
                    // First tab: Add notes to a caixinha
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20) {
                            Section {
                                VStack(spacing: 20) {
                                    TextFieldView(currentText: $textAdded)
                                    ChooseCategoryView(index: $indexCategorySelected)
                                    Button(action: { self.addText()
                                    }) {
                                        Text("guardar")
                                    }.buttonStyle(AddButtonStyle())
                                }.padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                            }
                        }.padding()
                    }
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Novo bilhete")
                    }
                    
                    // Second tab: See notes added in caixinha
                    ScrollView(showsIndicators: false) {
                        CaixinhaView()
                    }
                    .tabItem {
                    Image(systemName: "list.dash")
                    Text("Caixinha")
                    }
                }
            }
            .background(Color.green)
            .alert(isPresented: $showAlert, content: {self.alert})
    }
    
    func addText() {
        if self.textAdded != "" {
            self.createNoteCD()
        }
        self.textAdded = ""
        UIApplication.shared.endEditing()
    }
    
    func createNoteCD() {
        let note = NoteCD(context: self.managedObjectContext)
        note.configure(category: User.shared.categories[self.indexCategorySelected], text: self.textAdded)
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
        self.showAlert.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
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
