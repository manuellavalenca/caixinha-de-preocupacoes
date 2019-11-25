//
//  ListView.swift
//  caixinha
//
//  Created by Manuella Valença on 13/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct ListView: View {
    let category: String
    
    init(category: String) {
        self.category = category
        print(User.shared.getNotes(from: self.category))
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.lightBlue, .font: fonts.largeTitleCustom!]
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        List {
            ForEach(User.shared.getNotes(from: self.category), id: \.id) { note in
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color(colors.lightBlue)).cornerRadius(20)
                            .frame(width: 350.0, height: 125.0, alignment: .center)
                        Text(note.text).frame(width: 350.0, height: 125.0, alignment: .center)
                    }
                    Spacer()
                }
            }.onDelete(perform: self.delete)
        }.font(fonts.captionCustom)
            .foregroundColor(Color.white)
            .navigationBarTitle(self.category)
    }
     func delete(at offsets: IndexSet) {
        User.shared.notes.remove(atOffsets: offsets)
        print(User.shared.getNotes(from: self.category))
    }
}
