import Foundation
import CoreData
import UIKit

enum Router: URLRequestConvertible {
    
    static let baseURLString = "https://api.twitter.com/1.1"
    
    case GetFriend(screenName: String)
    
    case GetTwit(hashTag: String)
    
    var URLRequest: NSMutableURLRequest {
        let result: (path: String, parameters: [String: AnyObject]) = {
            switch self {
            case .GetFriend(let screenName):
                return ("/friends/list.json", ["screen_name": screenName])
            case .GetTwit(let hashTag):
                return ("/search/tweets.json", ["q": hashTag, "lang": "ru"])
            }
        }()
        
        let URL = NSURL(string: Router.baseURLString)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLRequest.setValue("Bearer AAAAAAAAAAAAAAAAAAAAADiJRQAAAAAAt%2Brjl%2Bqmz0rcy%2BBbuXBBsrUHGEg%3Dq0EK2aWqQMb15gCZNwZo9yqae0hpe2FDsS92WAu0g", forHTTPHeaderField: "Authorization")
        let encoding = ParameterEncoding.URL
        return encoding.encode(URLRequest, parameters: result.parameters).0
        
    }
}

class ServerManager {
    
    func getTweetsByHashTag(searchHashTag: String?, onFinish: ([Twit]?, NSError?) -> Void) {
        
        guard let hashTag = searchHashTag else {
            print("There is no words to search")
            return
        }
        
        Manager.sharedInstance.request(Router.GetTwit(hashTag: hashTag)).responseJSON(completionHandler: { response in
            if let data = response.result.value {
                let json = JSON(data)
                let statuses = json["statuses"].arrayValue
//                guard let statuses = json["statuses"] as? [AnyObject] else {
//                    onFinish(nil, NSError(domain: Twit.errorDomain, code: 3, userInfo: nil))
//                    return
//                }
                if statuses.count == 0 {
                    print("No twits with #\(hashTag)")
                    return
                }
                else {
                    var twits = [Twit]()
                    MagicalRecord.saveWithBlock({ (localContext) -> Void in
                        let request = NSFetchRequest()
                        let description : NSEntityDescription = NSEntityDescription.entityForName("Twit", inManagedObjectContext: localContext)!
                        request.entity = description
                        
                        if let oldTwits = try! localContext.executeFetchRequest(request) as? [Twit] {
                            for eachTwit in oldTwits {
                                localContext.deleteObject(eachTwit)
                            }
                        }
                        
                        for item in statuses {
                            if let twit = Twit.createTwit(item, currentContext: localContext) {
                                twits.append(twit)
                            }
                        }
                        }, completion: { (success, error) -> Void in
                            var mainThreadTwits = [Twit]()
                            for twit in twits {
                                if let mainThreadTwit = NSManagedObjectContext.MR_defaultContext().objectWithID(twit.objectID) as? Twit {
                                    mainThreadTwits.append(mainThreadTwit)
                                }
                            }
                            onFinish(mainThreadTwits, nil)
                    })
                }
            }
            else {
                print("Response result failed: \(response.result.isFailure)")
            }
        })
}

    func getFriendForTwit(twit: Twit, successFounded: ([Friend]?, NSError?)->Void) {
        
        guard let userName = twit.screenName else {
            print("Cannot find friend(s)")
            return
        }
        
        Manager.sharedInstance.request(Router.GetFriend(screenName: userName)).responseJSON(completionHandler: { response in
            if let data = response.result.value {
                let json = JSON(data)
                let users = json["users"].arrayValue
                if users.count == 0 {
                    print("\(userName) has no friends")
                    return
                }
                else {
                    var friends = [Friend]()
                    MagicalRecord.saveWithBlock({ (localContext) -> Void in
                        let request = NSFetchRequest()
                        let description: NSEntityDescription = NSEntityDescription.entityForName("Friend", inManagedObjectContext: localContext)!
                        let localTwit = localContext.objectWithID(twit.objectID) as! Twit
                        request.entity = description
                        request.predicate = NSPredicate(format: "twit == %@", localTwit)
                        if let oldFriends = try! localContext.executeFetchRequest(request) as? [Friend] {
                            for eachFriend in oldFriends {
                                localContext.deleteObject(eachFriend)
                            }
                        }
                        
                        for item in users {
                            if let friend = Friend.createFriend(item, currentContext: localContext) {
                                friend.twit = localTwit
                                friends.append(friend)
                            }
                        }
                        }, completion: { (success, error) -> Void in
                            print("find friends: success")
                            successFounded(nil, nil)
                    })
                }
            }
            else {
                print("Response result failed: \(response.result.isFailure)")
            }
        })
    }
}
