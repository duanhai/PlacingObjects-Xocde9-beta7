//
//  OldChair.swift
//  ARKitExample
//
//  Created by duanhai on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class OldChair: VirtualObject {
    override init() {
        super.init(modelName: "yizi", fileExtension: "DAE", thumbImageFilename: "vase", title: "Chair")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
