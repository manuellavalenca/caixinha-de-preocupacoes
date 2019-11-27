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
                            .frame(minHeight: 150)
                        Text(note.text!)
                    }
                    Spacer()
                }
            }.onDelete{offsets in
                for index in offsets {
                    let notesFromCategory = self.notes.filter{$0.category == self.category}
                    if index < notesFromCategory.count {
                        self.managedObjectContext.delete(notesFromCategory[index])
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }   .font(fonts.captionCustom)
            .foregroundColor(Color.white)
            .navigationBarTitle(self.category)
    }
}
