class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'activity_test'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    activity_view = UIActivityViewController.alloc.initWithActivityItems(['Google'], applicationActivities: nil)
    rootViewController.presentViewController(activity_view, animated: true, completion: nil)

    true
  end
end
