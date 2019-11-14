//
//  NoteAddedView.swift
//  caixinha
//
//  Created by Manuella Valença on 14/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

struct NoteAddedView: View {
    var category: String
    var text: String
    
    init (text: String, category: String) {
        self.text = text
        self.category = category
        User.shared.addNote(text: self.text, category: self.category)
        print("Notes: \(User.shared.notes)")
    }
    var body: some View {
        ZStack {
            Rectangle().fill(Color(colors.lightBlue)).cornerRadius(20)
            .frame(width: 300.0, height: 250.0, alignment: .center)
            Text("Note \(self.text) added in \(self.category)")
        }
    }
}
