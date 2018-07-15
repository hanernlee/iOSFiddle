//
//  FocusSquare.swift
//  DesignCodeARKit
//
//  Created by Christopher Lee on 16/7/18.
//  Copyright © 2018 Christopher Lee. All rights reserved.
//

import SceneKit

class FocusSquare: SCNNode {
    var isClosed: Bool = true {
        didSet {
            geometry?.firstMaterial?.diffuse.contents = self.isClosed ? UIImage(named: "FocusSquare/closed") : UIImage(named: "FocusSquare/open")
        }
    }
    
    override init() {
        super.init()
        
        let plane = SCNPlane(width: 0.1, height: 0.1)
        plane.firstMaterial?.diffuse.contents = UIImage(named: "FocusSquare/close")
        plane.firstMaterial?.isDoubleSided = true
        
        geometry = plane
        eulerAngles.x = GLKMathDegreesToRadians(-90)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
