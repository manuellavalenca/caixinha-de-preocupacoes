//
//  Categories.swift
//  caixinha
//
//  Created by Manuella Valença on 25/11/19.
//  Copyright © 2019 Manuella Valença. All rights reserved.
//

import Foundation
import CoreData

public class CategoryCD: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
}

extension CategoryCD {
    static func getAllCategories() -> NSFetchRequest<CategoryCD> {
        let request: NSFetchRequest<CategoryCD> = CategoryCD.fetchRequest() as! NSFetchRequest<CategoryCD>
        request.sortDescriptors = []
        return request
    }
}
