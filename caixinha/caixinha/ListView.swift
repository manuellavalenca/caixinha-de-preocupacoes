//
//  ListView.swift
//  caixinha
//
//  Created by Manuella Valença on 13/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ListView: View {
    let category: String
    //@ObservedObject var user = User.shared
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: NoteCD.entity(),
        sortDescriptors: []) var notes: FetchedResults<NoteCD>
    
    init(category: String) {
        self.category = category
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.pink, .font: fonts.largeTitleCustom!]
        UITableView.appearance().separatorColor = UIColor.clear
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        List {
            ForEach(self.notes.filter{$0.category == category}, id: \.id) { note in
                HStack {
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(colors.babyPink), lineWidth: 2)
                            .frame(minHeight: 150)
                        Text(note.text!).padding()
                    }
                    Spacer()
                }.contextMenu {
                    //                    Button(action: {
                    //                        // Edit text of note
                    //                    }) {
                    //                        HStack {
                    //                            Text("Edit")
                    //                            Image(systemName: "compose")
                    //                        }
                    //                    }
                    Button(action: {
                        self.copy(text: note.text!)
                    }) {
                        HStack {
                            Text("Copy")
                            Image(systemName: "doc.on.doc")
                        }
                    }
                    Button(action: {
                        self.delete(note)
                    }) {
                        HStack {
                            Text("Delete")
                            Image(systemName: "trash")
                        }
                    }
                }
            }
        }   .font(fonts.captionCustom)
            .foregroundColor(Color(colors.darkGray))
            .navigationBarTitle(self.category)
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
