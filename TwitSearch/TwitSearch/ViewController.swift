import CoreData
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let twitView: UIView
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var twits = [Twit]()
    
    var tableView: UITableView!
    var textField: UITextField
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.tableView = UITableView()
        self.textField = UITextField()
        self.twitView = UIView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.edgesForExtendedLayout = .None
        
    }
    
    func restoreLastTwits() {
        let request = NSFetchRequest(entityName: "Twit")
        let objects = try! NSManagedObjectContext.MR_defaultContext().executeFetchRequest(request) as? [Twit]
        if let lastTwits = objects {
             self.twits = lastTwits
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
//      UIButton
        
        let button = UIButton(type: .Custom)
        button.addTarget(self, action: "findTwitButton:", forControlEvents: .TouchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        let constraitRightButton = NSLayoutConstraint(
            item: button,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Right,
            multiplier: 1.0,
            constant: -10)
        
        let constraitTopButton = NSLayoutConstraint(
            item: button,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 50)
        self.view.addConstraint(constraitRightButton)
        self.view.addConstraint(constraitTopButton)
        
        button.setTitle("Найти", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
//        UITableView
        
        
        guard let tableView = self.tableView else {
            print("Cannot create a table view")
            return
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        let tableViewTopConstrait = NSLayoutConstraint(
            item: tableView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 100)
        
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
        
        tableView.separatorStyle = .None
        tableView.dataSource = self
        tableView.delegate = self
        
        restoreLastTwits()
        
        
//        UITextField
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        let textFieldTopConstrait = NSLayoutConstraint(
            item: self.textField,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Top,
            multiplier: 1.0,
            constant: 50)
        
        let textFieldBottomConstrait = NSLayoutConstraint(
            item: self.textField,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: tableView,
            attribute: .Top,
            multiplier: 1.0,
            constant: -10)
        
        let textFieldRightConstrait = NSLayoutConstraint(
            item: self.textField,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: button,
            attribute: .Right,
            multiplier: 1.0,
            constant: -40)
        
        let textFieldLeftConstrait = NSLayoutConstraint(
            item: self.textField,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Left,
            multiplier: 1.0,
            constant: 20)
        
        self.view.addConstraint(textFieldTopConstrait)
        self.view.addConstraint(textFieldBottomConstrait)
        self.view.addConstraint(textFieldRightConstrait)
        self.view.addConstraint(textFieldLeftConstrait)
        
        self.textField.placeholder = "Введите хэштег"
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twits.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = twits[indexPath.row].text
        cell.detailTextLabel?.text = twits[indexPath.row].createdDate
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let twit = twits[indexPath.row]
        print(twit.friends.count)
        let twitViewController  = TwitViewController(twit: twit)
        self.navigationController?.pushViewController(twitViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func findTwitButton(sender: UIButton!) {
        let manager = ServerManager()
        manager.getTweetsByHashTag(self.textField.text, onFinish: { (twits, error) in
            if let twits = twits {
                self.twits = twits
                self.tableView.reloadData()
            }
        })
    }
}