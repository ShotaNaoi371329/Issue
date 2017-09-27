//
//  ABRoadApi.swift
//  PreventIssue
//
//  Created by 15mac-09 on 2017/09/22.
//  Copyright © 2017年 ShotaNaoi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON


//MARK: - ABRoadApi
class ABRoadApi {
    
    func getTour(country: String, handlar: @escaping ([ABRoad]) -> ()) {
        
        print(country)
        let param: Parameters = [
            "key" : "a02a7ef9612310ca",
            "country" : country,
            "count" : 5,
            "format" : "json"
        ]
        
        Alamofire.request("https://webservice.recruit.co.jp/ab-road/tour/v1/", method: .get, parameters: param, encoding: URLEncoding()).responseJSON { response in
            
            guard let object = response.result.value else {
                
                print("not result value")
                return
            }
            
            let json: JSON = JSON(object)
            
            //            print(json)
            
            var abroad: [ABRoad] = []
            
            json["results"]["tour"].forEach { (_, tour) in
                
                let tmpAbroad: ABRoad = ABRoad(img: String(describing: tour["img"][0]["l"]), hotelName: String(describing: tour["hotel"][0]["name"]), price: String(describing: tour["price"]["min"]), country: country)
                
                abroad.append(tmpAbroad)
            }
            
            handlar(abroad)
        }
        
    }
    
//    func getImage(imageURL: String, handlar: @escaping (UIImage) -> ()) {
//        
//        Alamofire.request(imageURL).responseImage { response in
//            
//            guard let image = response.result.value else {
//                return
//            }
//            
//            handlar(image)
//        }
//    }
}
