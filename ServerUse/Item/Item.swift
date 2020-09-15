//
//  Item.swift
//  ServerUse
//
//  Created by EUNJUNG KIM on 2020/08/27.
//  Copyright © 2020 EUNJUNG KIM. All rights reserved.
//

import Foundation
import UIKit

struct Item{
    var itemid : Int!
    var itemname : String!
    var price : Int!
    var description : String!
    var pictureurl : String!
    
    //이미지를 다운로드 받아서 저장할 프로퍼티
    var image : UIImage!
}
