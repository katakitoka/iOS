import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        MagicalRecord.setupCoreDataStackWithAutoMigratingSqliteStoreNamed("twitsearch.sqlite")
        
        let menuViewController = MenuViewController()
        let findTwitController = ViewController()
        
        let mmDrawerController = MMDrawerController(centerViewController: findTwitController, leftDrawerViewController: menuViewController)
        
        let navigationController = UINavigationController(rootViewController: mmDrawerController.centerViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }

}

