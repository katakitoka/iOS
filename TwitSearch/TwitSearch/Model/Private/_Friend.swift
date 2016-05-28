// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Friend.swift instead.

import CoreData

public enum FriendAttributes: String {
    case friendID = "friendID"
    case friendName = "friendName"
}

public enum FriendRelationships: String {
    case twit = "twit"
}

@objc public
class _Friend: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Friend"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Friend.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var friendID: String?

    // func validateFriendID(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var friendName: String?

    // func validateFriendName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var twit: Twit?

    // func validateTwit(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

