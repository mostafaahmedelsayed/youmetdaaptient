






import UIKit

class DimUtility {
    
    fileprivate static var dimView: UIView! = UIView()
    
    class func setDimViewStyles() {
        dimView.frame = CGRect(x: 0, y: 0, width: Constants.ScreenWidth, height: Constants.ScreenHeight)
        dimView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }
    
    class func addDimView() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController!.view.addSubview(dimView)
    }
    
    class func removeDimView() {
        dimView.removeFromSuperview()
    }
    
}
