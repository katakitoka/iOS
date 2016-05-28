import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mmDrawerController: MMDrawerController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        MagicalRecord.setupCoreDataStackWithAutoMigratingSqliteStoreNamed("twitsearch.sqlite")
        
        let leftViewController = MenuViewController()
        let centerViewController = ViewController()
        
        mmDrawerController = MMDrawerController(centerViewController: centerViewController, leftDrawerViewController: leftViewController)
        
//        let navigationController = UINavigationController(rootViewController: mmDrawerController!.centerViewController)
        
        mmDrawerController?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView
        mmDrawerController?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView
        
        window?.rootViewController = mmDrawerController
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

