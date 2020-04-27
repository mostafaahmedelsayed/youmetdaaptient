//
//  Constants.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation

import Foundation
import UIKit

struct Constants {
    
    fileprivate static let ScreenSize: CGRect = UIScreen.main.bounds
    static let ScreenWidth = ScreenSize.width
    static let ScreenHeight = ScreenSize.height
    static let DeviceID = UIDevice.current.identifierForVendor!.uuidString
    struct UserDefaultsConstants {
        static let Email = "email"
        static let UserData = "UserData"
        static let Password = "password"
        static let FirstTime = "firstTime"
        static let isSocial = "isSocial"
        static let Token = "token"
    }
    var lang: String{
        
        if Languages.isArabic() {
            return "ar"
        }else {
            return "en"
        }
    }
    
    struct APIProvider {
        //        Login
        
        //        static var APIBase = "https://www.salamtak.me/api/"
        //        static var APIBase = "http://192.168.1.164:5555/api/"
        
        static var APIBaseURL = APIBase+"salamtak/"

        static var APIBase = "http://40.127.194.127:999/api/"
        static var Login = APIBaseURL+"Login"

        static var GetComplaints = APIBaseURL + "GetComplaints"
        
        static var GetGouvernements = APIBaseURL + "GetGouvernements"

        static var GetCitiesById = APIBaseURL + "GetCitiesById"
        
        static var SearchByKey = APIBaseURL + "SearchByKey"
        static var SmartSearch = APIBaseURL + "SmartSearch"

        static var GetAvailableSlots = APIBaseURL + "GetAvailableSlots"

        static var GetOthers = APIBaseURL + "getOthers"
        
        static var RequestAppointment = APIBaseURL + "RequestAppointment"
        static var AddOther = APIBaseURL + "AddOther"



        
        

        static var Register = APIBaseURL+"register"
        static var SyncData = APIBaseURL+"SearchByKey"
        static var UpdatePushKey = APIBaseURL+"UpdatePushKey"
        static var ResetPassword = APIBaseURL+"ForgetPassword"
        static var UpdateProfile = APIBaseURL+"UpdateProfile"
        static var ConfirmAccount = APIBaseURL+"confirm"
        static var SearchDoctors = APIBaseURL+"SmartSearch"
        static var GetMyDoctors = APIBaseURL+"MyDoctors"
        static var PatientRequest = APIBaseURL+"PatientRequest"
        static var GetSlots = APIBaseURL+"GetSlots"
        static var GetAvailableDays = APIBaseURL+"GetAvalibelDayes"
        static var Settings = APIBaseURL+"settings"
        static var ResendCode = APIBaseURL+"resendcode?api_token="
        static var ChangePassword = APIBaseURL+"ChangePassword"
        static var MyAppointment = APIBaseURL+" Salamtak-RequestAppointment"
        static var CancelAppointment = APIBaseURL+"CancelAppointment"
        static var DoctorReviews = APIBaseURL+"DoctorReviews"
        static var AddFavorite = APIBaseURL+"AddFavorite"
        static var RemoveFavorite = APIBaseURL+"RemoveFavorite"
        static var GetFavorites = APIBaseURL+"GetFavorite"
        static var GetPrescription = APIBaseURL+"GetPrescription"
        //01013084123 P@$$w0rd
        
    }
    
}
