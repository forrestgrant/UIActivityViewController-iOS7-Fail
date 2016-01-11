# RedPotion Bug
UIActivityViewController crashes the application when `redpotion` is required

Crash: `[UIActivityGroupViewController scale]: unrecognized selector sent to instance`

`app_delegate.rb`
```ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'activity_test'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    # This line causes a crash on an iPhone 4 running iOS 7.1.2
    # when redpotion is included
    activity_view = UIActivityViewController.alloc.initWithActivityItems(['Google'], applicationActivities: nil)
    rootViewController.presentViewController(activity_view, animated: true, completion: nil)

    true
  end
end
```

`Gemfile`
```ruby
source 'https://rubygems.org'

gem 'rake'
# Add your dependencies here:

# These gems are included in redpotion
gem 'motion-cocoapods'
gem "ruby_motion_query", ">= 1.6.1"
gem "ProMotion", ">= 2.4.2"
gem "motion_print"
gem "motion-cocoapods"
gem "RedAlert"

# if you remove this line, then it works
gem 'redpotion'
```
