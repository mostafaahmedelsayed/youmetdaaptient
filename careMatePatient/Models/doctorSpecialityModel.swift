//
//  doctorSpecialityModel.swift
//  careMatePatient
//
//  Created by khabeer on 4/20/20.
//  Copyright © 2020 khabeer. All rights reserved.
//

import Foundation
import ObjectMapper


class doctorSpecialityModel: Mappable {
 
    var   Doctors = [DoctorsearchModel]()
    var Specilaity = [specialitysearchModel]()
 
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.Doctors <- map["Doctors"]
        self.Specilaity <- map["Specilaity"]
 
    }
}


class DoctorsearchModel: Mappable {
 
    var   DoctorId = ""
    var ArabicName = ""
    var EnglishName = ""
 
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.DoctorId <- map["DoctorId"]
        self.ArabicName <- map["ArabicName"]
        self.EnglishName <- map["EnglishName"]
 
    }
}

class specialitysearchModel: Mappable {
  
    var   SpecilaityId = ""
    var ArabicName = ""
    var EnglishName = ""
 
    required  init?(map: Map) {
    }
    func mapping(map: Map) {
        
        self.SpecilaityId <- map["SpecilaityId"]
        self.ArabicName <- map["ArabicName"]
        self.EnglishName <- map["EnglishName"]
        


    }
}
