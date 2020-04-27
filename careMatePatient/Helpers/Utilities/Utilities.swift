//
//  Utilities.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import SCLAlertView
import UserNotifications

class Utilities: NSObject {
    
    
    
    struct Singleton {
        static let instance = Utilities()
    }
    
    class var sharedInstance: Utilities {
        return Singleton.instance
    }
    
    class func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }
    
    enum SearchDirection {
        case next
        case previous
        
        var calendarOptions: NSCalendar.Options {
            switch self {
            case .next:
                return .matchNextTime
            case .previous:
                return [.searchBackwards, .matchNextTime]
            }
        }
    }
    
    class func get(_ direction: SearchDirection, _ dayName: Int , tody: Date, considerToday consider: Bool = false) -> Date {
        let nextWeekDayIndex = dayName // weekday is in form 1 ... 7 where as index is 0 ... 6
        
        let today = tody
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        
        if consider && (calendar as NSCalendar).component(.weekday, from: today) == nextWeekDayIndex {
            return today
        }
        
        var nextDateComponent = DateComponents()
        nextDateComponent.weekday = nextWeekDayIndex
        
        
        let date = (calendar as NSCalendar).nextDate(after: today, matching: nextDateComponent, options: direction.calendarOptions)
        return date!
    }

    //MARK: - Email verification
    
    static func applyPlainShadow(_ view: UIView,color : UIColor ,shadowOpacity :Float, shadowRadius : CGFloat, shadowSize : CGSize) {
        let layer = view.layer
        
        layer.shadowColor = color.cgColor
        layer.shadowOffset = shadowSize
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    //MARK: -Alert Controller
    static func showAlert(_ viewController : UIViewController,messageToDisplay : String ) -> Void
    {
        
        
        
        SCLAlertView().showTitle(Languages.isArabic() ? "ملحوظة" : "Note", subTitle: messageToDisplay, style: .info, closeButtonTitle: Languages.isArabic() ? "حسناً" : "Ok", timeout: nil, colorStyle: 0x13437b, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: .topToBottom)
        
        //        let alertController = UIAlertController(title: "", message: messageToDisplay, preferredStyle: .alert)
        //
        //        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        //        alertController.addAction(defaultAction)
        //        viewController.present(alertController, animated: true, completion: nil)
    }
    
   
    class func showChooseDeliveryPopup(vc: UINavigationController)
    {
        let alertView = SCLAlertView()
        alertView.addButton(Languages.isArabic() ? "إختيار الطريقة": "Choose Type") {
            vc.pushViewController(vc.storyboard!.instantiateViewController(withIdentifier: "deliveryInsideeVC"), animated: true)
            
        }
        
        alertView.showTitle(Languages.isArabic() ? "ملحوظة" : "Note", subTitle: Languages.isArabic() ? "إختار طريقة التوصيل": "Choose delivery type", style: .notice, closeButtonTitle: Languages.isArabic() ? "إلغاء" : "Dismiss", timeout: nil, colorStyle: 0x13437b, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: .topToBottom)
    }
    
    class func showLoginAlert(vc: UINavigationController)
    {
        let alertView = SCLAlertView()
        alertView.addButton(Languages.isArabic() ? "تسجيل الدخول": "Login") {
            vc.GoToLoginView(nav: vc)
        }
        
        alertView.showTitle(Languages.isArabic() ? "ملحوظة" : "Note", subTitle: Languages.isArabic() ? "يجب أن تسجل الدخول أولاً": "You have to login first", style: .notice, closeButtonTitle: Languages.isArabic() ? "إلغاء" : "Dismiss", timeout: nil, colorStyle: 0x13437b, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: .topToBottom)
    }
    
    class func showGPSAlert()
    {
        let alertView = SCLAlertView()
        alertView.addButton(Languages.isArabic() ? "الذهاب الى الإعدادات": "Go To Setting") {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        alertView.showTitle(Languages.isArabic() ? "ملحوظة" : "Note", subTitle: Languages.isArabic() ? "يرجى السماح بإذن الموقع لإظهار موقعك الحالي": "Kindly allow location permission to show your current location", style: .notice, closeButtonTitle: Languages.isArabic() ? "إلغاء" : "Dismiss", timeout: nil, colorStyle: 0x13437b, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: .topToBottom)
    }
//    class func scheduleNotification(at date: Date,title: String,body: String) {
//        if CurrentLoggedUser != nil
//        {
//        let calendar = Calendar(identifier: .gregorian)
//        let components = calendar.dateComponents(in: .current, from: date)
//        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
//        
//        //        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
//        if #available(iOS 10.0, *) {
//            let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 2, repeats: false)
//            let content = UNMutableNotificationContent()
//            content.title = title
//            content.body = body
//            content.sound = UNNotificationSound.default
////            content.setValue("YES", forKey: "shouldAlwaysAlertWhileAppIsForeground")
//            
//                            let request = UNNotificationRequest(identifier: date.timeIntervalSince1970.description, content: content, trigger: trigger)
//                
//                //        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//                UNUserNotificationCenter.current().add(request) {(error) in
//                    if let error = error {
//                        print("Uh oh! We had an error: \(error)")
//                    }
//            }
//            
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//    }
    static func showSuccessAlert(_ viewController : UIViewController,messageToDisplay : String ) -> Void
    {
        
        SCLAlertView().showTitle(Languages.isArabic() ? "تم بنجاح" : "Success", subTitle: messageToDisplay, style: .success, closeButtonTitle: Languages.isArabic() ? "حسنا" : "Ok", timeout: nil, colorStyle: 0x13437b, colorTextButton: 0xFFFFFF, circleIconImage: nil, animationStyle: .topToBottom)
//        SCLAlertView().showTitle(
//            !Languages.isArabic() ? "تم بنجاح" : "Success",
//            subTitle: messageToDisplay,
//            duration: 0,
//            completeText: !Languages.isArabic() ? "حسنا" : "Ok",
//            style: .success,
//            colorStyle: 0x06B306 ,
//            colorTextButton: 0xFFFFFF
//        )
    }
    
    //MARK: -ROUND Image
    static func roundImageView (_ imageView : UIImageView)-> Void
    {
        imageView.layer.cornerRadius = imageView.bounds.size.height / 2
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        // imageView.layer.borderColor = UIColor(red: 253, green: 253, blue: 253).cgColor
    }
    
    //MARK: -ROUND Image
    static func roundView (_ view : UIView)-> Void
    {
        view.layer.cornerRadius = view.bounds.size.height / 2
        view.layer.masksToBounds = false
        view.clipsToBounds = true
    }
    
    static func roundCornerView (_ view : UIView, radius : CGFloat)-> Void
    {
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
    
    //MARK: -SCREEN WIDTH / HEIGHT
    static func getWidth() -> CGFloat
    {
        return UIScreen.main.bounds.size.width;
    }
    
    static func getHeight() -> CGFloat
    {
        return UIScreen.main.bounds.size.height;
    }
    
    //MARK: -Date
    static func getDateFromString(_ dateString : String, format : String) -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: dateString)
        return date!
    }
    
    static func getDifferenceBetweenTwoDates( _ firstDate : Date , secondDate : Date) -> Int
    {
        let flags = NSCalendar.Unit.year
        let calendar: Calendar = Calendar.current
        let components = (calendar as NSCalendar).components(flags, from: firstDate , to: secondDate, options: [])
        return components.year!
    }
    
    
//
//    static func heightWithConstrainedWidth(textLabel: String,width: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
//        let boundingBox = textLabel.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
//
//        return boundingBox.height + 10
//    }
    
    //MARK: -Image resize
    
    static func imageWithSize(image: UIImage,size: CGSize)->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(size,false,UIScreen.main.scale);
        
        image.draw(in: CGRect(x:0, y:0, width: size.width, height: size.height));
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage!;
    }
    
    static func resizeImageWithAspect(image: UIImage,scaledToMaxWidth width:CGFloat,maxHeight height :CGFloat)->UIImage
    {
        let oldWidth = image.size.width;
        let oldHeight = image.size.height;
        
        let scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
        
        let newHeight = oldHeight * scaleFactor;
        let newWidth = oldWidth * scaleFactor;
        let newSize = CGSize(width : newWidth,height :newHeight);
        
        return imageWithSize(image: image, size: newSize);
    }
    
    //MARK: -Get week day
    static func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let todayDate = formatter.date(from: today) {
            let myCalendar = Calendar(identifier: .gregorian)
            let weekDay = myCalendar.component(.weekday, from: todayDate)
            return weekDay
        } else {
            return nil
        }
    }
    
    //MARK : -set custom font to label
    // MARK: - Setting fonts
//    static func setFonts(mutableDescription :NSMutableAttributedString ,rangeString : String,fontName : String, fontSize : CGFloat, color : UIColor) -> () {
//        // set fonts
//        let rangeMarkString = (mutableDescription.string as NSString).range(of:rangeString) as NSRange
//
//        //        mutableDescription.addAttribute(NSFontAttributeName,
//        //                                        value: UIFont(
//        //                                            name: fontName,
//        //                                            size: CGFloat(fontSize))!,
//        //                                        range: rangeMarkString)
//
//        mutableDescription.addAttribute(NSAttributedStringKey.foregroundColor, value: color , range: rangeMarkString)
//    }
//
}
