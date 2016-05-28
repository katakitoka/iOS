// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Twit.swift instead.

import CoreData

public enum TwitAttributes: String {
    case createdDate = "createdDate"
    case friendCount = "friendCount"
    case profileImageURL = "profileImageURL"
    case screenName = "screenName"
    case text = "text"
    case userName = "userName"
}

public enum TwitRelationships: String {
    case friends = "friends"
}

@objc public
class _Twit: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Twit"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Twit.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var createdDate: String?

    // func validateCreatedDate(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var friendCount: String?

    // func validateFriendCount(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var profileImageURL: String?

    // func validateProfileImageURL(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var screenName: String?

    // func validateScreenName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var text: String?

    // func validateText(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var userName: String?

    // func validateUserName(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var friends: NSOrderedSet

}

extension _Twit {

    func addFriends(objects: NSOrderedSet) {
        let mutable = self.friends.mutableCopy() as! NSMutableOrderedSet
        mutable.unionOrderedSet(objects)
        self.friends = mutable.copy() as! NSOrderedSet
    }

    func removeFriends(objects: NSOrderedSet) {
        let mutable = self.friends.mutableCopy() as! NSMutableOrderedSet
        mutable.minusOrderedSet(objects)
        self.friends = mutable.copy() as! NSOrderedSet
    }

    func addFriendsObject(value: Friend!) {
        let mutable = self.friends.mutableCopy() as! NSMutableOrderedSet
        mutable.addObject(value)
        self.friends = mutable.copy() as! NSOrderedSet
    }

    func removeFriendsObject(value: Friend!) {
        let mutable = self.friends.mutableCopy() as! NSMutableOrderedSet
        mutable.removeObject(value)
        self.friends = mutable.copy() as! NSOrderedSet
    }

}

