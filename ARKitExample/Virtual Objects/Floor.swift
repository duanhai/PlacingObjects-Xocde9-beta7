//
//  Floor.swift
//  ARKitExample
//
//  Created by duanhai on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class Floor: VirtualObject {

    override init() {
        super.init()
        self.title = "Floor";
        self.modelName = "Floor";
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
}
