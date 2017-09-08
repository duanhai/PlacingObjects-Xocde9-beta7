//
//  Bench.swift
//  ARKitExample
//
//  Created by duanhai on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class Bench: VirtualObject {
    override init() {
        super.init(modelName: "chuangweideng", fileExtension: "DAE", thumbImageFilename: "vase", title: "Bench")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
