//
//  NoteCD.swift
//  caixinha
//
//  Created by Manuella Valença on 25/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import CoreData

public class NoteCD: NSManagedObject, Identifiable {
    @NSManaged public var category: String?
    @NSManaged public var text: String?
}

//extension NoteCD {
//    static func getAllNotes() -> NSFetchRequest<NoteCD> {
//        let request: NSFetchRequest<NoteCD> = NoteCD.fetchRequest() as! NSFetchRequest<NoteCD>
//        //let sortDescriptor = NSSortDescriptor(key: "text", ascending: false)
//        request.sortDescriptors = []
//        return request
//    }
//}
