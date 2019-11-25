//
//  User.swift
//  caixinha
//
//  Created by Manuella Valença on 13/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation

class User {
    static var shared = User()
    var notes: [Note] = []
    var categories: [String] = ["trabalho", "relacionamentos", "saúde", "outros", "lero", "lero lero"]
    
    func addNote(text: String, category: String) {
        self.notes.append(Note(text: text, category: category))
    }
    
    func getNotes(from category: String) -> [Note] {
        return User.shared.notes.filter{$0.category == category}
    }
    
//    func removeNote(id: UUID) {
//        User.shared.notes.filter{$0.id == id}.removeAll()
//    }
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
