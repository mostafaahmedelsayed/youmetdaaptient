//
//  userDTO.swift
//  careMatePatient
//
//  Created by khabeer on 4/18/20.
//  Copyright © 2020 khabeer. All rights reserved.
//
import ObjectMapper
import Foundation
class UserDTO: Mappable {
     
    var AspNetUsersId = 0
    var ClassId = 0
    var PhoneNumberConfirmed = true
    var  PatientImage = ""
    var Gender = 0
    var api_token = ""
    var id: Int = 0
    var first_name: String = "";
    var gender = 0;
    var email: String = "";
    var phone: String = "";
    var password: String = ""
    var BirthDate = ""
    var MobileNumber = ""
    var LastNameAr = ""
    var LastNameEn = ""
    var  HasInsurance = true
    
    var FirstNameAr = ""
    
    var  FirstNameEn = ""
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.HasInsurance <- map["HasInsurance"]

        self.ClassId <- map["ClassId"]
        self.AspNetUsersId  <- map["AspNetUsersId"]
        self.MobileNumber <- map["MobileNumber"]
        self.PatientImage <- map["PatientImage"]
        self.Gender <- map["Gender"]

        self.id <- map["id"]
        self.api_token <- map["api_token"]
        self.first_name <- map["Name"]
        self.gender <- map["gender"]
        self.email <- map["Email"]
        self.phone <- map["Phone"]
        self.password <- map["password"]
        self.BirthDate <- map["BirthDate"]
        self.FirstNameAr <- map["FirstNameAr"]
        
        self.FirstNameEn <- map["FirstNameEn"]

        self.LastNameEn <- map["LastNameEn"]

        self.LastNameAr <- map["LastNameAr"]

        self.PhoneNumberConfirmed <- map["LastNameEn"]

        self.FirstNameAr <- map["FirstNameAr"]

    }
}





class complainsSearchDoctorModel: Mappable {
     
    

    
    var   id = 0
    var code = 0
    var ArabicName = ""
    var EnglishName = ""
    var  SpecialtyId = 0
    var SpecialtyId2 = 0
    var SpecialtyId3 = 0
    var pages_count: Int = 0
    
    var rnum: Int = 0

   
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.id <- map["id"]
        self.code <- map["code"]
        self.ArabicName <- map["ArabicName"]
        self.EnglishName <- map["EnglishName"]
        self.SpecialtyId <- map["SpecialtyId"]

        self.SpecialtyId2 <- map["SpecialtyId2"]

      
        self.SpecialtyId3 <- map["SpecialtyId3"]
        self.pages_count <- map["pages_count"]
        
        self.rnum <- map["rnum"]


    }
}



