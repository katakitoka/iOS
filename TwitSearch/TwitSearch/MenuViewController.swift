//
//  MenuViewController.swift
//  TwitSearch
//
//  Created by student on 28.05.16.
//  Copyright © 2016 Владислав Навроцкий. All rights reserved.
//

import Foundation

<<<<<<< HEAD
class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
=======
extension MenuItem {
    func viewController() -> UIViewController {
        switch self {
        case .FindTwits:
            return ViewController()
        case .Feed:
            return FeedViewController()
        case .Favorites:
            return FavoritesViewController()
        }
    }
}

@objc
class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    static let startMenuItemIndex = 0
    static let kMenuItemCellHeight: Float = 55.0
    
    var tableView: UITableView!
    
    var selectedMenuItem = MenuItem.FindTwits
    var menuItems: [MenuItem] = MenuItem.allValues()
    var viewControllers: [UIViewController] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        for eachItem in menuItems {
            viewControllers.append(eachItem.viewController())
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.yellowColor()
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundView = nil
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.alwaysBounceVertical = false
        tableView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    func selectMenuItemAt(index: Int) {
        selectedMenuItem = menuItems[index]
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(MenuViewController.kMenuItemCellHeight)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = menuItems[indexPath.row]
        let isCurrent = item == selectedMenuItem
        
        let cell = MenuTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: MenuTableViewCell.reuseID)
        
        cell.cleanUp()
        cell.model = item
        cell.isCurrent = isCurrent
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        selectMenuItemAt(indexPath.row)
        tableView.reloadData()
    }
    
    // MARK: FeedsListener
    
    func onFeedsBeginRefreshing() {
        
    }
    
    func onFeedsEndRefreshing() {
        tableView.reloadData()
>>>>>>> dataSource
    }
}