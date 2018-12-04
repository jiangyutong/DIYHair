//
//  hairDetails.swift
//  DIY Hair
//
//  Created by jiang on 2018/12/4.
//  Copyright © 2018年 blueGrey. All rights reserved.
//

import UIKit
class HairDetails
{
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }

}
