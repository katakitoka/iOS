import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
<<<<<<< HEAD
=======
    var mmDrawerController: MMDrawerController?
>>>>>>> dataSource

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        MagicalRecord.setupCoreDataStackWithAutoMigratingSqliteStoreNamed("twitsearch.sqlite")
        
<<<<<<< HEAD
        let menuViewController = MenuViewController()
        let findTwitController = ViewController()
        
        let mmDrawerController = MMDrawerController(centerViewController: findTwitController, leftDrawerViewController: menuViewController)
        
        let navigationController = UINavigationController(rootViewController: mmDrawerController.centerViewController)
        window?.rootViewController = navigationController
=======
        let leftViewController = MenuViewController()
        let centerViewController = ViewController()
        
        mmDrawerController = MMDrawerController(centerViewController: centerViewController, leftDrawerViewController: leftViewController)
        
//        let navigationController = UINavigationController(rootViewController: mmDrawerController!.centerViewController)
        
        mmDrawerController?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView
        mmDrawerController?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView
        
        window?.rootViewController = mmDrawerController
>>>>>>> dataSource
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

