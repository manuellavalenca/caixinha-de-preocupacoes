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
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.lightBlue, .font: fonts.largeTitleCustom!]
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Spacer()
                VStack {
                    ForEach(User.shared.notes.filter{$0.category == self.category}, id: \.id) { note in
                        HStack {
                            Spacer()
                            ZStack{
                                Rectangle().fill(Color(colors.lightBlue)).cornerRadius(20)
                                    .frame(width: 350.0, height: 125.0, alignment: .center)
                                Text(note.text).frame(width: 350.0, height: 125.0, alignment: .center)
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
            }.font(fonts.captionCustom)
                .accentColor(Color.clear)
                .foregroundColor(Color.white)
        }.navigationBarTitle(self.category)
    }
}
