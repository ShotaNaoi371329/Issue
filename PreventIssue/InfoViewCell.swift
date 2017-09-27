//
//  InfoViewCustomCell.swift
//  PreventIssue
//
//  Created by 15mac-09 on 2017/09/22.
//  Copyright © 2017年 ShotaNaoi. All rights reserved.
//

import UIKit
import EasyPeasy


//MARK: - InfoViewCell
class InfoViewCell: UICollectionViewCell {
    //MARK: Internal
    
    var hotelImage: UIImageView = UIImageView()
    var spotNameLabel: UILabel = UILabel()
    var priceLabel: UILabel = UILabel()
    var imageURL: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        hotelImage.image = UIImage()
        //hotelImage.contentMode = .scaleAspectFit
        hotelImage.backgroundColor = UIColor.black
        
        let heartImage: UIImageView = UIImageView(image: UIImage(named: "heart_white.png"))
        hotelImage.addSubview(heartImage)
        
        spotNameLabel.numberOfLines = 2
        spotNameLabel.text = "aatetetetetetetetetetetsdaf;fjiewfilwehfilwe blib lwbfwliebflwbflawb iwebf lwaeetetetete"
        spotNameLabel.textColor = UIColor.black
        spotNameLabel.font = UIFont.systemFont(ofSize: spotNameLabel.font.pointSize, weight: UIFontWeightSemibold)
        
        priceLabel.numberOfLines = 1
        priceLabel.textColor = UIColor.black
        priceLabel.font = UIFont(name: "Heiti SC", size: priceLabel.font.pointSize)
        priceLabel.font = UIFont.systemFont(ofSize: priceLabel.font.pointSize, weight: UIFontWeightThin)
        //priceLabel.backgroundColor = UIColor.black
        priceLabel.text = "testyen"
        
        
        self.addSubview(hotelImage)
        self.addSubview(spotNameLabel)
        self.addSubview(priceLabel)
        
        layout: do {
            
            heartImage <- [
                Size(20),
                Top(5),
                Right(5)
            ]
            
            hotelImage <- [
                Height(130),
                Top(0),
                Left(0),
                Right(0),
                //Bottom(0)
                Bottom(0).to(spotNameLabel, .top)
            ]
            
            spotNameLabel <- [
                //Top(0),
                Left(5),
                Right(5),
                Bottom(0).to(priceLabel, .top)
            ]
            
            priceLabel <- [
                Left(5),
                Right(5),
                Bottom(4)
            ]
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
