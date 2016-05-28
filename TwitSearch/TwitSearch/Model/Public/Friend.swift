import CoreData

@objc(Friend)
public class Friend: _Friend {

    static let errorDomain = "Fatal! No data was recieved!"
    
    class func createFriend(object: JSON, currentContext: NSManagedObjectContext!) -> Friend? {
        let friend = Friend.MR_createEntityInContext(currentContext)

        friend.friendID = String(object["id"])

        friend.friendName = String(object["name"])
        
        return friend
    }

}
