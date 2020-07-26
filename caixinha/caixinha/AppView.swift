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
                        VStack(alignment: .leading) {
                            Section {
                                VStack() {
                                    //ChooseCategoryView(index: $indexCategorySelected)
                                    Picker(selection: $indexCategorySelected, label:
                                        Text("Categoria"), content: {
                                            ForEach(0..<User.shared.categories.count){ index in
                                                Text(User.shared.categories[index]).tag(index)
                                            }
                                    }
                                    ).font(fonts.captionCustom)
                                        .pickerStyle(SegmentedPickerStyle())
                                        .foregroundColor(Color(colors.darkGray))
                                    BigTextView(text: defineTextAccordingToCategory(category: indexCategorySelected))
                                    TextFieldView(currentText: $textAdded)
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
    
    func categoryChanged(_ tag: Int) {
        print("category changed: \(tag)")
    }
    
    func defineTextAccordingToCategory(category: Int) -> String {
        // ["geral","trabalho", "estudos", "saúde"]
        var text = ""
        
        if category == 0 {
            text = "Em geral,\ncom o que você tem se preocupado?"
        } else if category == 1 {
            text = "No trabalho,\ncom o que você tem se preocupado?"
        } else if category == 2 {
            text = "Nos estudos,\ncom o que você tem se preocupado?"
        } else if category == 3 {
            text = "Na saúde,\ncom o que você tem se preocupado?"
        }
        return text
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

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
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
