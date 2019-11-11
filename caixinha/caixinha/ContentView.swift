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
    
    @State var textAdded: String = ""
    @State var buttonSelected: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Seção de adicionar bilhetinho
                Spacer()
                VStack(alignment: .leading, spacing: 16) {
                    Section(header: Text("adicionar").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
                        HStack(alignment: .center) {
                            Spacer()
                            Button(action: {}) {
                                Text("trabalho")
                            }.buttonStyle(CategoryButtonStyle())
                            Spacer()
                            Button(action: {
                                //print
                            }) { Text("relacionamentos")
                            }.buttonStyle(CategoryButtonStyle())
                            Spacer()
                            Button(action: {
                                //print
                            }) { Text("saúde")
                            }.buttonStyle(CategoryButtonStyle())
                            Spacer()
                        }
                        Rectangle().fill(Color(colors.lightBlue)).cornerRadius(20)
                            .frame(width: 25.0, height: 2.0, alignment: .center)
                        VStack {
                            HStack{
                                Spacer()
                                TextField("Abre o coração", text: $textAdded).border(Color(colors.lightBlue), width: 1).cornerRadius(10.0).frame(width: 200, height: 200, alignment: .center).lineLimit(nil)
                                Spacer()
                            }
                            Button(action: {
                                //print
                            }) { Text("adicionar bilhete")
                            }.buttonStyle(AddButtonStyle())
                        }
                    }.padding(.horizontal)
                    
                    // Seção de ver bilhetinhos
                    Section(header: Text("caixinha").font(fonts.headlineCustom).foregroundColor(Color(colors.darkGray))) {
                        HStack(alignment: .center) {
                            Spacer()
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
