//
//  CategoryCustomCell.swift
//  PreventIssue
//
//  Created by 15mac-09 on 2017/09/22.
//  Copyright © 2017年 ShotaNaoi. All rights reserved.
//

import UIKit
import EasyPeasy

//MARK: - CategoryCell
class CategoryCell: UITableViewCell {
    //MARK: Internal
    
    var countryLabel: UILabel =  UILabel()
    var allLookLabel: UIButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        countryLabel.text = "testCountry"
        countryLabel.font = UIFont.systemFont(ofSize: countryLabel.font.pointSize+5, weight: UIFontWeightLight)
        
        allLookLabel.setTitle("すべて見る >", for: .normal)
        allLookLabel.setTitleColor(UIColor.gray, for: .normal)
        allLookLabel.titleLabel?.font = UIFont.systemFont(ofSize: (allLookLabel.titleLabel?.font.pointSize)!, weight: UIFontWeightThin)
        allLookLabel.addTarget(self, action: #selector(tapAll(sender:)), for: .touchUpInside)
        
        self.addSubview(countryLabel)
        self.addSubview(allLookLabel)
        
        layout: do {
            
            countryLabel <- [
                Top(30),
                Left(20),
                Bottom(20),
            ]
            
            allLookLabel <- [
                Top(30),
                Right(20),
                Bottom(20)
            ]
        }
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    func tapAll(sender: UIButton) {
        
        print("tapAll")
    }
}
