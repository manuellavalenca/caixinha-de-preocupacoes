//
//  ContentView.swift
//  caixinha
//
//  Created by Manuella Valença on 11/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import SwiftUI
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
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading, spacing: 16) {
                    Section(header: Text("adicionar").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
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
                                TextView(text: $textAdded)
                                    .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: .infinity)
                                .border(Color(colors.lightBlue), width: 2.0)
                                .statusBar(hidden: true)
                                .cornerRadius(20)
                                .font(fonts.headlineCustom)
                                .foregroundColor(Color(colors.darkGray))
                                Spacer()
                            }
//                            NavigationLink(destination: NoteAddedView(text: self.textAdded, category: self.categorySelected)){
//                                Text("adicionar bilhete")
//                            }.font(fonts.headlineCustom).foregroundColor(Color.blue)
//
                            Button(action: {
                                self.showingDetail.toggle()
                            }) {
                                Text("adicionar bilhete")
                            }.buttonStyle(AddButtonStyle())
                            .sheet(isPresented: $showingDetail) {
                                NoteAddedView(text: self.textAdded, category: self.categorySelected)
                            }
                        }
                    }.padding(.horizontal)
                    
                    Section(header: Text("caixinha").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
                        ScrollView (.horizontal, showsIndicators: false) {
                             HStack {
                                ForEach(User.shared.categories, id: \.self) { category in
                                    ZStack {
                                        CategoryCellView(category: category)
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
