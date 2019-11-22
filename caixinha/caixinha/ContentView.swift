//
//  ContentView.swift
//  caixinha
//
//  Created by Manuella Valença on 11/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.lightBlue, .font: fonts.largeTitleCustom!]
    }
    
    @State var buttonSelected: String = ""
    //@State var showingDetail = false
    @State var detail: ModalDetail?
    @State var textAdded: String = ""
    //@Environment(\.presentationMode) var presentationMode
    @State var categorySelected = "trabalho"
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading, spacing: 40) {
                    HStack {
                        Spacer()
                        ZStack{
                            Button(action: {
                                //self.showingDetail.toggle()
                                self.detail = ModalDetail(body: "Detail")
                            }){
                                Image("addButton").resizable().frame(width: 50, height: 50, alignment: .center)
                            }.sheet(item: $detail, content: { detail in
                                self.modal(detail: detail.body)
                            })
                        }
                        Spacer()
                    }
                    Section {
                        ScrollView (.horizontal, showsIndicators: false) {
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
    
    func modal(detail: String) -> some View {
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
                   print("oie")
                }) {
                    Text("adicionar bilhete")
                }.buttonStyle(AddButtonStyle())
            }
        }.frame(width: 300, height: 150, alignment: .center)
    }
}

struct ModalDetail: Identifiable {
    var id: String {
        return body
    }
    
    let body: String
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
