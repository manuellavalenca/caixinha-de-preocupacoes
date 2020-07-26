//
//  User.swift
//  caixinha
//
//  Created by Manuella Valença on 13/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    static var shared = User()
    @Published var notes = [Note]()
    var categories: [String] = ["geral","trabalho", "estudos", "saúde"]
    
    func addNote(text: String, category: String) {
        self.notes.append(Note(text: text, category: category))
    }
    
    func getNotes(from category: String) -> [Note] {
        return User.shared.notes.filter{$0.category == category}
    }
}

struct Note: Identifiable {
    var id = UUID ()
    var text: String = ""
    var category: String = ""
    
    init(text: String, category: String) {
        self.id = UUID()
        self.text = text
        self.category = category
    }
}
