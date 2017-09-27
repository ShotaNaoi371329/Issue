//
//  StructABRoad.swift
//  PreventIssue
//
//  Created by 15mac-09 on 2017/09/26.
//  Copyright © 2017年 ShotaNaoi. All rights reserved.
//

import UIKit


// MARK: - ABRoad
struct ABRoad {
    
    var img: String
//    var image: UIImage = UIImage(named: "test.png")!
    var hotelName: String
    var price: String
    var country: String
    
    init(img: String, hotelName: String, price: String, country: String) {
        self.img = img
        self.hotelName = hotelName
        self.price = price
        self.country = country
    }
    
}

