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
    @ObservedObject var user = User.shared
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: NoteCD.getAllNotes()) var notes: FetchedResults<NoteCD>
    
    init(category: String) {
        self.category = category
        print(self.user.getNotes(from: self.category))
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: colors.lightBlue, .font: fonts.largeTitleCustom!]
        UITableView.appearance().separatorColor = UIColor.clear
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        List {
            ForEach(self.notes.filter{$0.category == category}, id: \.id) { note in
                HStack {
                    Spacer()
                    ZStack{
                        Rectangle().fill(Color(colors.lightBlue)).cornerRadius(20)
                            .frame(width: 350.0, height: 125.0, alignment: .center)
                        Text(note.text!).frame(width: 350.0, height: 125.0, alignment: .center)
                    }
                    Spacer()
                }
            }.onDelete{offsets in
                //self.user.notes.remove(atOffsets: offsets)
                //print("delete")
                //print(self.user.getNotes(from: self.category))
                print(self.notes)
                for index in offsets {
                    let notinhas = self.notes.filter{$0.category == self.category}
                    let note = notinhas[index]
                    self.managedObjectContext.delete(note)
                }
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                print("delete")
                print(self.notes)
            }
        }   .font(fonts.captionCustom)
            .foregroundColor(Color.white)
            .navigationBarTitle(self.category)
    }
}
