//
//  UserModel.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class UserModel: NSObject {
    
    class func Login(vc: UIViewController , data: [String:Any] , callback: @escaping (UserDTO?) -> Void) {
        
        let mangar = WebserviceMananger.sharedInstance
        if Reachability.isConnectedToNetwork() {
            
            indicator.sharedInstance.show()
            
            AlamofireAppManager.shared.request(Constants.APIProvider.Login, method: .post, parameters: data, encoding: JSONEncoding.default, headers: nil).responseJSON
                { response in
                    
                    
                    let json = JSON(response.value)
                    
                    
                    if response.response?.statusCode == 200 && response.response != nil
                    {
                        indicator.sharedInstance.dismiss()
                        
                        
                        if let jsonUser =  json.dictionaryObject
                        {
                            let UserDTOITem =   UserDTO(JSON: jsonUser )
                            print(jsonUser)
                            print(jsonUser["Token"])
                            
                            
                            let def = UserDefaults.standard
                            def.setValue(jsonUser["Token"], forKey: "databaseToken")
                            def.synchronize()
                            
                            let patientMobile = UserDefaults.standard
                            patientMobile.setValue(jsonUser["MobileNumber"], forKey: "patientMobile")
                            patientMobile.synchronize()
                            callback(UserDTOITem)
                        }
                        else{
                            
                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ في البريد الالكتروني او كلمه السر" : "Username Or password is wrong")
                        }
                        
                    }
                        
                        
                        
                    else{
                        Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                        
                    }
                    
                    
            }
        }
            
        else{
            
            indicator.sharedInstance.dismiss()
            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
        }
        
        
    }
    
    
    
    class func loadPatientComplains(vc: UIViewController , data: [String:Any] , callback: @escaping ([complainsSearchDoctorModel]?) -> Void) {
        
        let mangar = WebserviceMananger.sharedInstance
        if Reachability.isConnectedToNetwork() {
            
            indicator.sharedInstance.show()
            
            AlamofireAppManager.shared.request(Constants.APIProvider.GetComplaints, method: .post, parameters: data, encoding: JSONEncoding.default, headers: nil).responseJSON
                { response in
                    
                    
                    
                    var arrayOfComplain = [complainsSearchDoctorModel]()
                    
                    let json = JSON(response.value)
                    
                    
                    if response.response?.statusCode == 200 && response.response != nil
                    {
                        indicator.sharedInstance.dismiss()
                        
                        
                        if let jsonComplains =  json["complaints"].array
                        {
                            
                            for jsonComplainsItem in jsonComplains
                            {
                                
                                
                                let complainsSearchDoctorModelITem =   complainsSearchDoctorModel(JSON: jsonComplainsItem.dictionaryObject! )
                                
                                arrayOfComplain.append(complainsSearchDoctorModelITem!)
                                
                            }
                            
                            callback(arrayOfComplain)
                        }
                        else{
                            
                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد شكوي" : "No Complains")
                        }
                        
                    }
                        
                        
                        
                    else{
                        Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                        
                    }
                    
                    
            }
        }
            
        else{
            
            indicator.sharedInstance.dismiss()
            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
        }
        
        
    }
    
    
    
    
    class func loadGovernments(vc: UIViewController , callback: @escaping ([governmentsModel]?) -> Void) {
        
        let mangar = WebserviceMananger.sharedInstance
        if Reachability.isConnectedToNetwork() {
            
            indicator.sharedInstance.show()
            
            AlamofireAppManager.shared.request(Constants.APIProvider.GetGouvernements, method: .post, parameters: [:], encoding: JSONEncoding.default, headers: nil).responseJSON
                { response in
                    
                    
                    
                    var arrayOfComplain = [governmentsModel]()
                    
                    let json = JSON(response.value)
                    
                    print(json)
                    
                    if response.response?.statusCode == 200 && response.response != nil
                    {
                        indicator.sharedInstance.dismiss()
                        
                        
                        if let jsonComplains =  json["Gouvernements"].array
                        {
                            
                            for jsonComplainsItem in jsonComplains
                            {
                                
                                
                                let governmentsModelITem =   governmentsModel(JSON: jsonComplainsItem.dictionaryObject! )
                                
                                arrayOfComplain.append(governmentsModelITem!)
                                
                            }
                            
                            callback(arrayOfComplain)
                        }
                        else{
                            
                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد شكوي" : "No Complains")
                        }
                        
                    }
                        
                        
                        
                    else{
                        Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                        
                    }
                    
                    
            }
        }
            
        else{
            
            indicator.sharedInstance.dismiss()
            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
        }
        
        
    }
    
    
    class func loadGovernmentCities(vc: UIViewController,GovId:Int , callback: @escaping ([governmentsModel]?) -> Void) {
        
        let mangar = WebserviceMananger.sharedInstance
        if Reachability.isConnectedToNetwork() {
            
            indicator.sharedInstance.show()
            
            AlamofireAppManager.shared.request(Constants.APIProvider.GetCitiesById, method: .post, parameters: ["GovId":GovId], encoding: JSONEncoding.default, headers: nil).responseJSON
                { response in
                    
                    
                    
                    var arrayOfComplain = [governmentsModel]()
                    
                    let json = JSON(response.value)
                    
                    print(json)
                    
                    if response.response?.statusCode == 200 && response.response != nil
                    {
                        indicator.sharedInstance.dismiss()
                        
                        
                        if let jsonComplains =  json["Cities"].array
                        {
                            
                            for jsonComplainsItem in jsonComplains
                            {
                                
                                
                                let governmentsModelITem =   governmentsModel(JSON: jsonComplainsItem.dictionaryObject! )
                                
                                arrayOfComplain.append(governmentsModelITem!)
                                
                            }
                            
                            callback(arrayOfComplain)
                        }
                        else{
                            
                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد شكوي" : "No Complains")
                        }
                        
                    }
                        
                        
                        
                    else{
                        Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                        
                    }
                    
                    
            }
        }
            
        else{
            
            indicator.sharedInstance.dismiss()
            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
        }
        
        
    }
    
    class func loadDoctorList(vc: UIViewController,param:[String:Any] , callback: @escaping (DoctorsListModel) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            
            
            
            var listOfDoctorList = [DoctorsListModel]()
            indicator.sharedInstance.show()
            
            AlamofireAppManager.shared.request(Constants.APIProvider.SmartSearch, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON
                { response in
       
                    let json = JSON(response.value)
                    
                    
                    print(param)
                    
                    print(json)
                    
                    if response.response?.statusCode == 200 && response.response != nil
                    {
                        indicator.sharedInstance.dismiss()
                        
                        
                        if let jsonComplains =  json.dictionaryObject
                        {
                            
//                            for jsonComplainsItem in jsonComplains
//                            {
//
                                
                                let DoctorsListModelITem =   DoctorsListModel(JSON: jsonComplains )
//
//                                listOfDoctorList.append(DoctorsListModelITem!)
//
//                            }
                            
                            callback(DoctorsListModelITem!)
                        }
                        else{
                            indicator.sharedInstance.dismiss()

                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد شكوي" : "No Complains")
                        }
                        
                    }
                        
                    else{
                        Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                        
                        indicator.sharedInstance.dismiss()

                    }
                    
            }
        }
            
        else{
            
            indicator.sharedInstance.dismiss()
            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
        }
        
        
    }
    
    
    class func getDoctorAvailableSlots(vc: UIViewController,param:[String:Any] , callback: @escaping ([AvailableDoctorSlots]) -> Void) {
            
            if Reachability.isConnectedToNetwork() {
                
                
                
                var arrayOfDoctorSlotsItemList = [AvailableDoctorSlots]()
                indicator.sharedInstance.show()
                
                AlamofireAppManager.shared.request(Constants.APIProvider.GetAvailableSlots, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON
                    { response in
           
                        let json = JSON(response.value)
                        print("sttuesCode")
                        print(response.response?.statusCode)
                        
                        
//                        var jsonArray = json[0].dictionaryObject!["slotdata"]
                        
//                        print(jsonArray!)
//                        
//                        print("json00000")
//                        print(json[0].dictionary)
                        
                        
                        
                        print(param)
                        
                        print(json)
                        if response.response?.statusCode == 200 && response.response != nil
                        {
                            
                            
                            indicator.sharedInstance.dismiss()
                            
                            
                            
                            if let arrayOfDoctorSlots =  json[0]["slotdata"].array
                            {
                                
                                
                                
                                for arrayOfDoctorSlotsItem in arrayOfDoctorSlots
                                {
                                    
                                   var AvailableDoctorSlotsItem = AvailableDoctorSlots(JSON: arrayOfDoctorSlotsItem.dictionaryObject!)
                                    
                                    
                                    
                                    arrayOfDoctorSlotsItemList.append(AvailableDoctorSlotsItem!)
                               
                                 
                                }
                                

                                
                                callback(arrayOfDoctorSlotsItemList)
                            }
                            else{
                                indicator.sharedInstance.dismiss()

                                Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد شكوي" : "No Complains")
                            }
                            
                        }
                            
                        else{
                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                            
                            indicator.sharedInstance.dismiss()

                        }
                        
                }
            }
                
            else{
                
                indicator.sharedInstance.dismiss()
                Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
            }
            
            
        }
    
    class func loadDoctorsAndSpeciality(vc: UIViewController,SearchByKey:String , callback: @escaping (doctorSpecialityModel?) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            
            indicator.sharedInstance.show()
            
            AlamofireAppManager.shared.request(Constants.APIProvider.SearchByKey, method: .post, parameters: ["KeyWord":SearchByKey], encoding: JSONEncoding.default, headers: nil).responseJSON
                { response in
                    
                    
                    
                    
                    let json = JSON(response.value)
                    
                    print(json)
                    
                    print("\(SearchByKey)  SearchByKey ")
                    
                    if response.response?.statusCode == 200 && response.response != nil
                    {
                        indicator.sharedInstance.dismiss()
                        
                        
                        if let jsonComplains =  json.dictionaryObject
                        {
                            let  doctorSpecialityModelJSon = doctorSpecialityModel(JSON: jsonComplains)
                            
                            callback(doctorSpecialityModelJSon)
                        }
                        else{
                            
                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد شكوي" : "No Complains")
                        }
                        
                    }
                        
                    else{
                        Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                        
                    }
                    
            }
        }
            
        else{
            
            indicator.sharedInstance.dismiss()
            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
        }
        
        
    }
    
    
    
    class func getOtherswhoVisitPatinet(vc: UIViewController , callback: @escaping ([otherPersonsModel]) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            
            indicator.sharedInstance.show()
            
            var getothersList = [otherPersonsModel]()
            
            if let dataToken =  UserDefaults.standard.string(forKey: "databaseToken")
                {
                    
                    let header = [
                        "Authorization": "Bearer \(dataToken)",
                    ]
                    AlamofireAppManager.shared.request(Constants.APIProvider.GetOthers, method: .get, parameters: [:],  headers: header).responseJSON
                { response in
                    
                    
                    
                    
                    let json = JSON(response.value)
                    print(header)
                    print(json)
                    
                    
                    if response.response?.statusCode == 200 && response.response != nil
                    {
                        indicator.sharedInstance.dismiss()
                        
                        
                        if let getOthersList =  json.array
                        {
                            
                            
                            for getOthersItem in getOthersList
                            {
                               var otherPersonsModelItem = otherPersonsModel(JSON: getOthersItem.dictionaryObject!)
                                
                                getothersList.append(otherPersonsModelItem!)

                            
                            }
                            callback(getothersList)

                        }
                        else{
                            
                            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد شكوي" : "No Complains")
                        }
                        
                    }
                        
                    else{
                        Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                        
                    }
                    
            }
        }
        }
            
        else{
            
            indicator.sharedInstance.dismiss()
            Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
        }
        
        
    }
    
    
    
    class func RequestAppointment(vc: UIViewController ,parameters:[String:Any] ,callback: @escaping ([otherPersonsModel]) -> Void) {
           
           if Reachability.isConnectedToNetwork() {
               
               indicator.sharedInstance.show()
               
               var getothersList = [otherPersonsModel]()
               
               if let dataToken =  UserDefaults.standard.string(forKey: "databaseToken")
                   {
                       
                       let header = [
                           "Authorization": "Bearer \(dataToken)",
                       ]
                       AlamofireAppManager.shared.request(Constants.APIProvider.RequestAppointment, method: .post, parameters: parameters,  headers: header).responseJSON
                   { response in
                       
                       
                    print(JSON(response.value))
                    
                       
                       
                       if response.response?.statusCode == 200 && response.response != nil
                       {
                           indicator.sharedInstance.dismiss()
                           
                           
                              Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "الحجر تم بنجاع" : "Booking DoneSucessfully")
                           
                       }
                           
                       else{
                           Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                           
                       }
                       
               }
           }
           }
               
           else{
               
               indicator.sharedInstance.dismiss()
               Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
           }
           
           
       }
    
    
    
    class func addOtherPatient(vc: UIViewController ,parameters:[String:Any] ,callback: @escaping ([otherPersonsModel]) -> Void) {
           
           if Reachability.isConnectedToNetwork() {
               
               indicator.sharedInstance.show()
               
               var getothersList = [otherPersonsModel]()
               
               if let dataToken =  UserDefaults.standard.string(forKey: "databaseToken")
                   {
                       
                       let header = [
                           "Authorization": "Bearer \(dataToken)",
                       ]
                       AlamofireAppManager.shared.request(Constants.APIProvider.AddOther, method: .post, parameters: parameters,  headers: header).responseJSON
                   { response in
                       
                       
                    print(JSON(response.value))
                    
                       
                       
                       if response.response?.statusCode == 200 && response.response != nil
                       {
                           indicator.sharedInstance.dismiss()
                           
                           
                              Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "الحجر تم بنجاع" : "Booking DoneSucessfully")
                           
                       }
                           
                       else{
                           Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "هناك خطآ" : "There is An Error")
                           
                       }
                       
               }
           }
           }
               
           else{
               
               indicator.sharedInstance.dismiss()
               Utilities.showAlert(vc, messageToDisplay : Languages.isArabic() ? "لا يوجد اتصال بالانترنت" : "No Internet Connection")
           }
           
           
       }
}
