//
//  BestBuyClient.swift
//  Findy
//
//  Created by Oskar Zhang on 9/20/15.
//  Copyright © 2015 FindyTeam. All rights reserved.
//

import Foundation

class WalmartClient {
    static let key = "usruh6qabx8ct6vkbn3ta3ru"
    
    class func search(keywords:String,onSuccess:([String],[String],[Int])->Void)
    {
        let url = "http://api.walmartlabs.com/v1/search"
        let dict = ["apiKey":key,"query":keywords]
        let client = OAuthSwiftClient(consumerKey: "", consumerSecret: "")
        client.get(url, parameters: dict, success: { (data, response) -> Void in
            let json = JSON(data: data)
            var images:[String] = []
            var names:[String] = []
            var prices:[Int] = []
            for (key,item) in json["items"]
            {
                let image = item["thumbnailImage"].stringValue
                images.append(image)
                let name = item["name"].stringValue
                names.append(name)
                let price = item["salePrice"].intValue
                prices.append(price)
            }
            onSuccess(names,images,prices)
            
            }) { (error) -> Void in
                
        }
        
    }
        
}