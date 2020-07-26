//
//  ContextMenuView.swift
//  caixinha
//
//  Created by Manuella Valença on 29/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var showingAlert = false
    var note: NoteCD
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: NoteCD.entity(),
        sortDescriptors: []) var notes: FetchedResults<NoteCD>
    
    var body: some View {
        Group{
            Button(action: {
                self.copy(text: self.note.text!)
            }) {
                HStack {
                    Text("Copiar")
                    Image(systemName: "doc.on.doc")
                }
            }
            Button(action: {
                self.showingAlert = true
            }) {
                HStack {
                    Text("Excluir")
                    Image(systemName: "trash")
                }
            }
            .alert(isPresented:self.$showingAlert) {
                Alert(title: Text("Tem certeza que quer deletar?"), message: Text("Não é possível desfazer essa ação."), primaryButton: .destructive(Text("Excluir")) {
                    self.delete(self.note)
                    }, secondaryButton: .cancel())
            }
        }
    }
    
    func copy(text: String) {
        UIPasteboard.general.string = text
    }
    
    func delete(_ note: NoteCD) {
        self.managedObjectContext.delete(note)
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
    }
}

//struct ContextMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContextMenuView()
//    }
//}
