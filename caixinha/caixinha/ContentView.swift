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

struct ContentView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.lightBlue, .font: fonts.largeTitleCustom!]
        self.textAdded = ""
    }
    
    @State var textAdded = ""
    @State var buttonSelected: String = ""
    @State var categorySelected = "trabalho"
    @State var showingDetail = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: UserData.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \UserData.categories, ascending: true)
        ]
    ) var categories: FetchedResults<UserData>
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading, spacing: 16) {
                    Section {
                        HStack(alignment: .center) {
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
                                TextField("Escreva sua preocupação", text: $textAdded)
                                    .border(Color(colors.transparentBlue), width: 1.0)
                                    .cornerRadius(6)
                                    .font(fonts.captionCustom)
                                //                                TextView(text: $textAdded)
                                //                                    .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: .infinity)
                                //                                .border(Color(colors.lightBlue), width: 2.0)
                                //                                .statusBar(hidden: true)
                                //                                .cornerRadius(20)
                                //                                .font(fonts.headlineCustom)
                                //                                .foregroundColor(Color(colors.darkGray))
                                Spacer()
                            }
                            
                            Button(action: {
                                //self.showingDetail.toggle()
                                if self.textAdded != "" {
                                    User.shared.addNote(text: self.textAdded, category: self.categorySelected)
                                }
                                self.textAdded = ""
                            }) {
                                Text("adicionar bilhete")
                            }.buttonStyle(AddButtonStyle())
                            //                            .sheet(isPresented: $showingDetail) {
                            //                                NoteAddedView(text: self.textAdded, category: self.categorySelected)
                            //                            }
                        }
                    }.padding(.horizontal)
                    
                    Section(header: Text("explorar").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
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
                    }.padding(.horizontal)
                }
            }
            .navigationBarTitle("caixinha de preocupações", displayMode: .large).lineLimit(nil)
            .listStyle(GroupedListStyle())
            .padding(.top)
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
