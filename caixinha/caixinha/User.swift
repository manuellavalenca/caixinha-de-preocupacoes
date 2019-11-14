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
    var notes: [Note] = [Note(text: "que saco me atrasei para o evento", category: "trabalho"), Note(text: "que saco me atrasei para o médico", category: "saúde"), Note(text: "que saco me atrasei para o encontro", category: "relacionamentos")]
    var categories: [String] = ["trabalho", "relacionamentos", "saúde"]
    
    func addNote(text: String, category: String) {
        self.notes.append(Note(text: text, category: category))
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
