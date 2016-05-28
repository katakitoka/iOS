import CoreData

@objc(Twit)
public class Twit: _Twit {

    static let errorDomain = "Fatal! No data was recieved!"
    
    class func createTwit(object: JSON, currentContext: NSManagedObjectContext!) -> Twit? {
        let twit = Twit.MR_createEntityInContext(currentContext)

        twit.createdDate = String(object["created_at"])
        twit.text = String(object["text"])
        
        let user = object["user"]
        twit.profileImageURL = String(user["profile_image_url"])
        twit.userName = String(user["name"])
        twit.friendCount = String(user["friends_count"].intValue)
        twit.screenName = String(user["screen_name"])
        
        return twit
    }

}
