//
//  CategoryCollectionView.swift
//  PreventIssue
//
//  Created by 15mac-09 on 2017/09/23.
//  Copyright © 2017年 ShotaNaoi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import EasyPeasy


//MARK: - CateforyCollectionViewCell
class CategoryCollectonViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: Internal
    
    var infoCollectionView: UICollectionView!
    var collectionViewData: [ABRoad] = []
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.itemSize = CGSize(width: 180, height: 200)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        infoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        infoCollectionView.showsHorizontalScrollIndicator = false
        print(infoCollectionView)
        
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
        infoCollectionView.register(InfoViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        infoCollectionView.backgroundColor = UIColor.white
        self.addSubview(infoCollectionView)
        
        layout: do {
            
            infoCollectionView <- [
                Top(0),
                Left(10),
                Right(10),
                Bottom(0)
            ]
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

// MARK: - CategoryCollectionViewCell
extension CategoryCollectonViewCell {
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! InfoViewCell
        
//        cell.backgroundColor = UIColor.white
        cell.hotelImage.image = nil
//        cell.hotelImage.image = collectionViewData[indexPath.row].image
        cell.hotelImage.clipsToBounds = true
        cell.hotelImage.layer.cornerRadius = 5
        cell.spotNameLabel.text = "default"
        cell.priceLabel.text = "defaultYen"
        
//        cell.imageURL = collectionViewData[indexPath.row].img
        
        Alamofire.request(collectionViewData[indexPath.row].img, method: .get).responseImage { response in

            guard let image = response.result.value else {
                return
            }

            cell.hotelImage.image = image
        }
//        cell.hotelImage.af_setImage(withURL: NSURL(string: collectionViewData[indexPath.row].img)! as URL)
        cell.spotNameLabel.text = collectionViewData[indexPath.row].hotelName
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        
        let result = formatter.string(from: Int(collectionViewData[indexPath.row].price) as! NSNumber)
        
        cell.priceLabel.text = "￥" + result! + "から"
//        cell.priceLabel.text = "￥あたり"
        
        print(cell.frame)
//        cell.frame.size = CGSize(width: 100, height: 100)
        return cell
    }
    
    
}

