<<<<<<< HEAD
//
//  FriendsViewController.swift
//  TwitSearch
//
//  Created by student on 27.05.16.
//  Copyright © 2016 Владислав Навроцкий. All rights reserved.
//

=======
>>>>>>> dataSource
import Foundation


class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var twit: Twit
    var friends = [Friend]()
    
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .White)
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
<<<<<<< HEAD
    var userNameLabel: UILabel
    var userIDLabel: UILabel
=======
    var userNameButton: UIButton
    var friendCountLabel: UILabel
>>>>>>> dataSource
    var imageView: UIImageView
    var tableView: UITableView!
    
    init(twit: Twit) {
        self.twit = twit
        
        self.friends = twit.friends.array as! [Friend]
<<<<<<< HEAD
        self.userNameLabel = UILabel()
        self.userIDLabel = UILabel()
=======
        self.userNameButton = UIButton()
        self.friendCountLabel = UILabel()
>>>>>>> dataSource
        self.imageView = UIImageView()
        self.tableView = UITableView()
        
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = .None
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
<<<<<<< HEAD
        self.view.addSubview(userNameLabel)
        self.view.addSubview(userIDLabel)
=======
        self.view.addSubview(userNameButton)
        self.view.addSubview(friendCountLabel)
>>>>>>> dataSource
        self.view.addSubview(imageView)
        
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
        
<<<<<<< HEAD
        self.userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let userNameLabelTopConstrait = NSLayoutConstraint(
            item: self.userNameLabel,
=======
        self.userNameButton.translatesAutoresizingMaskIntoConstraints = false
        
        let userNameLabelTopConstrait = NSLayoutConstraint(
            item: self.userNameButton,
>>>>>>> dataSource
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0)
        
        let userNameLabelLeftConstrait = NSLayoutConstraint(
<<<<<<< HEAD
            item: self.userNameLabel,
=======
            item: self.userNameButton,
>>>>>>> dataSource
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.imageView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0)
        
        self.view.addConstraint(userNameLabelTopConstrait)
        self.view.addConstraint(userNameLabelLeftConstrait)
        
        //        UILabel: friendCount
        
<<<<<<< HEAD
        self.userIDLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let friendCountLabelTopConstrait = NSLayoutConstraint(
            item: self.userIDLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.userNameLabel,
=======
        self.friendCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let friendCountLabelTopConstrait = NSLayoutConstraint(
            item: self.friendCountLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.userNameButton,
>>>>>>> dataSource
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0)
        
        let friendCountLabelLeftConstrait = NSLayoutConstraint(
<<<<<<< HEAD
            item: self.userIDLabel,
=======
            item: self.friendCountLabel,
>>>>>>> dataSource
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.imageView,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0)
        
        self.view.addConstraint(friendCountLabelTopConstrait)
        self.view.addConstraint(friendCountLabelLeftConstrait)
        
        //        add data
        
<<<<<<< HEAD
        self.userNameLabel.text = self.twit.userName
        self.userIDLabel.text = "ID пользователя: " + twit.screenName!
=======
        self.userNameButton.setTitle(twit.userName, forState: .Normal)
        self.friendCountLabel.text = "Количество друзей: " + twit.friendCount!
>>>>>>> dataSource
        
        let imageURL = NSURL(string: twit.profileImageURL!)
        self.imageView.af_setImageWithURL(imageURL!)
        
<<<<<<< HEAD
=======
        
>>>>>>> dataSource
        //        UITableView
        guard let tableView = self.tableView else {
            print("Ошибка сосздания Table View")
            return
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        let tableViewTopConstrait = NSLayoutConstraint(
            item: tableView,
            attribute: .Top,
            relatedBy: .Equal,
<<<<<<< HEAD
            toItem: self.imageView,
=======
            toItem: self.friendCountLabel,
>>>>>>> dataSource
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0)
        
        let tableViewBottomConstrait = NSLayoutConstraint(
            item: tableView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0)
        
        let tableViewRightConstrait = NSLayoutConstraint(
            item: tableView,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Right,
            multiplier: 1.0,
            constant: 0)
        
        let tableViewLeftConstrait = NSLayoutConstraint(
            item: tableView,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 0)
        
        self.view.addConstraint(tableViewTopConstrait)
        self.view.addConstraint(tableViewBottomConstrait)
        self.view.addConstraint(tableViewRightConstrait)
        self.view.addConstraint(tableViewLeftConstrait)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        findFriend()
        
        //        UIActivityIndicatorView
        
        self.activityIndicatorView.hidesWhenStopped = true
        let barStatus = UIBarButtonItem(customView: self.activityIndicatorView)
        self.navigationItem.rightBarButtonItem = barStatus
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = friends[indexPath.row].friendName
        cell.detailTextLabel?.text = friends[indexPath.row].friendID
        return cell
    }
    
    func findFriend() {
        let manager = ServerManager()
        self.activityIndicatorView.startAnimating()
        manager.getFriendForTwit(twit, successFounded: { (friends, errors) in
            NSManagedObjectContext.MR_defaultContext().refreshAllObjects()
            self.friends = self.twit.friends.array as! [Friend]
            self.tableView.reloadData()
            self.activityIndicatorView.stopAnimating()
            print(self.friends.count)
        })
    }

}