//
//  DoctorsListModel.swift
//  careMatePatient
//
//  Created by khabeer on 4/22/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation
import ObjectMapper


class DoctorsListModel: Mappable {
    
    var Doctors = [DoctorAllModel]()
//    var DoctorQulificationObject:DoctorQulification?
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.Doctors <- map["Doctors"]
    }
}

class DoctorAllModel: Mappable {
    
    var ClinicImages = [String]()
    
    var Branches = [DoctorBranches]()
    
    
    var DoctorClassess = [DoctorClasses]()
    
    
    
    var  DoctorSmallObject:DoctorSmall?
    
    
    var SelectedPromotionId = 0
    
    var SlotView = 0
    var slotDate = ""
    
    
    var slotTime = ""
    var branchId = ""
    var IsUseLocation = true
    
    var SlotSource = 0
    
    var Promotions = ""
    
    
    var Services = ""
    var   SupportInsurance = true
    
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.ClinicImages <- map["ClinicImages"]
        self.Branches <- map["Branches"]
        self.DoctorClassess <- map["DoctorClasses"]
        self.DoctorSmallObject <- map["Doctor"]
        
        self.SelectedPromotionId <- map["SelectedPromotionId"]
        
        
        self.SlotView <- map["SlotView"]
        self.slotDate <- map["slotDate"]
        self.slotTime <- map["slotTime"]
        self.branchId <- map["branchId"]
        self.IsUseLocation <- map["IsUseLocation"]
        
        
        self.SlotSource <- map["SlotSource"]
        self.Promotions <- map["Promotions"]
        self.Services <- map["Services"]
        
        self.SupportInsurance <- map["SupportInsurance"]
        
        
    }
}






class DoctorBranches: Mappable {
    
    
    var slots = [String]()
    
    
    var AddressLat = ""
    
    var AddressLng = ""
    
    var BranchArName = ""
    var BranchEnName = ""
    
    var BranchId = 0
    
    var HasPromotion = true
    
    var LicenceId = ""
    
    var start = ""
    var end = ""
    
    var freedate = ""
    
    var Distance = 0
    var AddressAr = ""
    
    var AddressEn = ""
    
    var CityId = 0
    
    
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.slots <- map["slots"]
        
        self.AddressLat <- map["AddressLat"]
        self.AddressLng <- map["AddressLng"]
        self.BranchArName <- map["BranchArName"]
        self.BranchEnName <- map["BranchEnName"]
        self.BranchId <- map["BranchId"]
        self.HasPromotion <- map["HasPromotion"]
        
        self.LicenceId <- map["LicenceId"]
        
        self.start <- map["start"]
        self.end <- map["end"]
        self.freedate <- map["freedate"]
        
        
        self.Distance <- map["Distance"]
        
        
        self.AddressAr <- map["AddressAr"]
        
        self.AddressEn <- map["AddressEn"]
        
        self.CityId <- map["CityId"]
        
        
        
        
    }
}


class DoctorClasses: Mappable {
    
    
    var Id = 0
    
    
    var ArabicName = ""
    
    var EnglishName = ""
    
    var IsSelectedClass = true
    var IsCash = true
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        
        self.Id <- map["Id"]
        self.ArabicName <- map["ArabicName"]
        self.EnglishName <- map["EnglishName"]
        self.IsSelectedClass <- map["IsSelectedClass"]
        self.IsCash <- map["IsCash"]
        
        
        
        
        
    }
}





class DoctorSmall: Mappable {
    
    var SubSpecialitiesList = [SubSpecialities]()
    var CurrentPage = 0
    
    
    var pages_count = 0
    
    var DoctorId = ""
    
    var ProviderId = 0
    var LicenseNumber = ""
    
    var ArabicName:String?
    
    var EnglishName = ""
    var DoctorAboutAr = ""
    var DoctorAboutEn = ""
    var MobileNumber = ""
    
    var DoctorRate = 0.0
    var IsMale = true
    var DoctorTitle = 0
    var DoctorTitleAr = ""
    
    var SpecialtNameAr = ""
    var SpecialtNameEn = ""
    var LicenceId = 0
    
    var SpecialtId = 0
    var SpecialtCode = 0
    
    var Price = 0.0
    
    var IsFavorite = true
    
    var CurrencName = ""
    
    var IntervalOfConsultation = 0
    var Ratecount = 0
    
    var Source = 0
    
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
       
        self.CurrentPage <- map["CurrentPage"]
        self.pages_count <- map["pages_count"]
        self.DoctorId <- map["DoctorId"]
        self.ProviderId <- map["ProviderId"]
        self.LicenseNumber <- map["LicenseNumber"]
        
        
        
        self.ArabicName <- map["ArabicName"]
        self.EnglishName <- map["EnglishName"]
        
        
        
        
        self.DoctorAboutAr <- map["DoctorAboutAr"]
        self.DoctorAboutEn <- map["DoctorAboutEn"]
        
        
        
        self.MobileNumber <- map["MobileNumber"]
        self.DoctorRate <- map["DoctorRate"]
        
        
        
        self.IsMale <- map["IsMale"]
        self.DoctorTitle <- map["DoctorTitle"]
        
        
        self.DoctorTitleAr <- map["DoctorTitleAr"]
        
        
        
        self.SpecialtNameAr <- map["SpecialtNameAr"]
        self.SpecialtNameEn <- map["SpecialtNameEn"]
        
        
        self.LicenceId <- map["LicenceId"]
        
        
        
        self.SpecialtId <- map["SpecialtId"]
        self.SpecialtCode <- map["SpecialtCode"]
        
        
        self.Price <- map["Price"]
        
        
        self.IsFavorite <- map["IsFavorite"]
        self.CurrencName <- map["CurrencName"]
        
        
        self.IntervalOfConsultation <- map["IntervalOfConsultation"]
        
        
        self.Ratecount <- map["Ratecount"]
        
        self.Source <- map["Source"]
        
        
    }
}



class SubSpecialities: Mappable {
    
    
    var SubSpecialityId = 0
    
    var SubSpecialityEn = ""
    
    var SubSpecialityAr = ""
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        
        self.SubSpecialityId <- map["SubSpecialityId"]
        self.SubSpecialityEn <- map["SubSpecialityEn"]
        self.SubSpecialityAr <- map["SubSpecialityAr"]
        
    }
}


class DoctorQulification: Mappable {
    
    var DoctorQulificationServicesList = [DoctorQulificationServices]()
    var Certifications = [String]()
    
    var Education = [String]()
    
    var Memberships = [String]()
    var DInsuranceCompany = [String]()
    
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.Certifications <- map["Certifications"]
        self.Education <- map["Education"]
        self.Memberships <- map["Memberships"]
        self.DInsuranceCompany <- map["DInsuranceCompany"]
  
    }
}


class DoctorQulificationServices: Mappable {
    
    var ServiceEn = ""
    
    var ServiceAr = ""
    
    var ServicePrice = 0.0
    
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
     
        self.ServiceEn <- map["ServiceEn"]
        self.ServiceEn <- map["ServiceEn"]
        self.ServicePrice <- map["ServicePrice"]
        
        
    }
}


