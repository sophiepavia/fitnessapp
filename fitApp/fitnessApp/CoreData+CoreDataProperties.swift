//
//  CoreData+CoreDataProperties.swift
//  
//
//  Created by Alex Serrano on 3/10/21.
//
//

import Foundation
import CoreData


extension CoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreData> {
        return NSFetchRequest<CoreData>(entityName: "CoreData")
    }

    @NSManaged public var exerciseName: String?
    @NSManaged public var weight: Int32
    @NSManaged public var repsPerSet: Int32
    @NSManaged public var sets: Int32
    @NSManaged public var focusArea: String?
    @NSManaged public var exerciseDescription: String?
    @NSManaged public var workoutName: String?
    @NSManaged public var date: Date?

}
