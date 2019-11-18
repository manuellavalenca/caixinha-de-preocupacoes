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
    @State var showingDetail = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading, spacing: 40) {
                    HStack {
                        Spacer()
                        ZStack{
                            Button(action: {
                                self.showingDetail.toggle()
                            }){
                                Image("addButton")
                            }.sheet(isPresented: $showingDetail) {
                                AddButtonView()
                            }
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
