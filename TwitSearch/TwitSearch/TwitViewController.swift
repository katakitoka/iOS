import Foundation
import CoreData
import UIKit


class TwitViewController: UIViewController {
    
    var twit: Twit
    var friends = [Friend]()
    
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .White)
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var userNameButton: UIButton
    var friendCountLabel: UILabel
    var imageView: UIImageView
    var twitText: UILabel

    init(twit: Twit) {
        self.twit = twit
        
        self.friends = twit.friends.array as! [Friend]
        self.userNameButton = UIButton()
        self.friendCountLabel = UILabel()
        self.imageView = UIImageView()
        self.twitText = UILabel()
        
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = .None
    }
    


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(userNameButton)
        self.view.addSubview(friendCountLabel)
        self.view.addSubview(imageView)
        self.view.addSubview(twitText)
        
//        UIImage
        let imageViewTopConstrait = NSLayoutConstraint(
            item: self.imageView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0)
        
        let imageViewLeftConstrait = NSLayoutConstraint(
            item: self.imageView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0)
        
        self.view.addConstraint(imageViewTopConstrait)
        self.view.addConstraint(imageViewLeftConstrait)
        
        self.imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
//        UIButton: userName
        
        self.userNameButton.translatesAutoresizingMaskIntoConstraints = false
        
        let userNameLabelTopConstrait = NSLayoutConstraint(
            item: self.userNameButton,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0)
        
        let userNameLabelLeftConstrait = NSLayoutConstraint(
            item: self.userNameButton,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.imageView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0)
        
        self.view.addConstraint(userNameLabelTopConstrait)
        self.view.addConstraint(userNameLabelLeftConstrait)

//        UILabel: friendCount
        
        self.friendCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let friendCountLabelTopConstrait = NSLayoutConstraint(
            item: self.friendCountLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.userNameButton,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0)
        
        let friendCountLabelLeftConstrait = NSLayoutConstraint(
            item: self.friendCountLabel,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.imageView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0)
        
        self.view.addConstraint(friendCountLabelTopConstrait)
        self.view.addConstraint(friendCountLabelLeftConstrait)
        
//        TextField: twitText
        
        self.twitText.translatesAutoresizingMaskIntoConstraints = false
        
        let twitTextTopConstraint = NSLayoutConstraint(
            item: self.twitText,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.friendCountLabel,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 20)
        
        let twitTextLeftConstraint = NSLayoutConstraint(
            item: self.twitText,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 5)
        
        let twitTextRightConstraint = NSLayoutConstraint(
            item: self.twitText,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Right,
            multiplier: 1.0,
            constant: 5)
        
        self.view.addConstraint(twitTextTopConstraint)
        self.view.addConstraint(twitTextLeftConstraint)
        self.view.addConstraint(twitTextRightConstraint)
        
//        add data
        
        userNameButton.setTitle(twit.userName, forState: .Normal)
        userNameButton.addTarget(self, action: "showFriends", forControlEvents: .TouchUpInside)
<<<<<<< HEAD
        userNameButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
=======
        userNameButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
>>>>>>> dataSource
        
        friendCountLabel.text = "Количество друзей: " + twit.friendCount!
        
        twitText.numberOfLines = 100
        twitText.text = twit.text
        
        let imageURL = NSURL(string: twit.profileImageURL!)
        imageView.af_setImageWithURL(imageURL!)

    }
    
    func showFriends() {
       let friendViewController  = FriendsViewController(twit: twit)
        self.navigationController?.pushViewController(friendViewController, animated: true)
    }
}