//
//  Desk.swift
//  ARKitExample
//
//  Created by duanhai on 2017/9/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class Desk: VirtualObject {
    override init() {
        super.init(modelName: "desk_B", fileExtension: "dae", thumbImageFilename: "vase", title: "Desk")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
