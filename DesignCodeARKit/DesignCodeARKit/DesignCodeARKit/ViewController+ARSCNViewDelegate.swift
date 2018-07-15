//
//  ViewController+ARSCNViewDelegate.swift
//  DesignCodeARKit
//
//  Created by Christopher Lee on 16/7/18.
//  Copyright © 2018 Christopher Lee. All rights reserved.
//

import SceneKit
import ARKit

extension ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
            
        let planeAnchor = anchor as! ARPlaneAnchor
        let planeNode = createPlane(planeAnchor: planeAnchor)
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
        
        let planeAnchor = anchor as! ARPlaneAnchor
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
        
        let planeNode = createPlane(planeAnchor: planeAnchor)
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
        
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
    }
    
    func createPlane(planeAnchor: ARPlaneAnchor) -> SCNNode {
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        plane.firstMaterial?.diffuse.contents = UIImage(named: "grid")
        plane.firstMaterial?.isDoubleSided = true
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
//        planeNode.eulerAngles.x = -.pi / 2
        planeNode.eulerAngles.x = GLKMathDegreesToRadians(-90)
        return planeNode
    }
    
}
