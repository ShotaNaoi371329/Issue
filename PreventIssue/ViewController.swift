//
//  ViewController.swift
//  PreventIssue
//
//  Created by 15mac-09 on 2017/09/22.
//  Copyright © 2017年 ShotaNaoi. All rights reserved.
//

/*--------------------------------------------------
 ランキング　http://www.arukikata.co.jp/en/winter_a/2016/2017.html 参考
 https://webservice.recruit.co.jp/ab-road/country/v1/ より国のコードを確認
 let country = ["ハワイ",　"イタリア",　"フランス", "台湾",　"スペイン"]
 let countryCode = ["HW", "IT", "FR", "TW", "ES"]
--------------------------------------------------*/

import UIKit
import EasyPeasy


//MARK: - ViewController
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: Private
    
    private var findTableView: UITableView = UITableView()
    private let abRoadApi = ABRoadApi()
    private let countryCode:[String] = ["HW", "IT", "FR", "TW", "ES"]
    private let countryName:[String:String] = ["HW":"ハワイ", "IT":"イタリア", "FR":"フランス", "TW":"台湾", "ES":"スペイン"]
    private let images: [UIImage] = []
    
    private var data: [[ABRoad]] = []
    
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findTableView.delegate = self
        findTableView.dataSource = self
        findTableView.register(CategoryCell.self, forCellReuseIdentifier: NSStringFromClass(CategoryCell.self))
        findTableView.register(CategoryCollectonViewCell.self, forCellReuseIdentifier: NSStringFromClass(CategoryCollectonViewCell.self))
        findTableView.separatorStyle = .none
        
        self.view.addSubview(findTableView)
        
        layout: do {
            
            findTableView <- [
                Top(0),
                Left(0),
                Right(0),
                Bottom(0)
            ]
        }
        
        var count: Int = 0
        
        for code in countryCode {
            
            abRoadApi.getTour(country: code) { [weak self] abroad in
                
                count += 1
                
                self?.data.append(abroad)
                
                print(abroad)
                print("\n\n\n")
                
                if count == 5 {
                    
//                    //いい書き方がわからない
//                    var count2:Int = 0
//                    let ii:Int = (self?.data.count)!
//                    for i in 0..<ii {
//                        let jj:Int = (self?.data[i].count)!
//                        for j in 0..<jj {
//                            abRoadApi.getImage(imageURL: (self?.data[i][j].img)!, handlar: { image in
//
//                                self?.data[i][j].image = image
//                                count2 += 1
//                                if count2 == 25 { //5カテゴリ * 5要素
//                                    self?.findTableView.reloadData()
//                                }
//                            })
//                        }
//                    }
                    print(self?.data)
                    self?.findTableView.reloadData()
                }
            }
        }
        
    }
    

    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data.count*2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        var cell: UITableViewCell!
        if indexPath.row%2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CategoryCell.self), for: indexPath) as! CategoryCell
            cell.countryLabel.text = countryName[data[(indexPath.row/2)][0].country]
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CategoryCollectonViewCell.self), for: indexPath) as! CategoryCollectonViewCell
            
            print((indexPath.row-1) / 2)
            print(data[(indexPath.row-1)/2])
            cell.collectionViewData = data[(indexPath.row-1)/2]
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.infoCollectionView.reloadData()
            
            return cell
        }
    }
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row%2 == 0 {
             return UITableViewAutomaticDimension
        } else {
             return 200
        }
    }
}

