/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Wrapper SceneKit node for virtual objects placed into the AR scene.
*/

import Foundation
import SceneKit
import ARKit

class VirtualObject: SCNNode {
	
	var modelName: String = ""
	var fileExtension: String = ""
	var thumbImage: UIImage!
	var title: String = ""
	var modelLoaded: Bool = false
	
	var viewController: ViewController?
	
	override init() {
		super.init()
		self.name = "Virtual object root node"
	}
	
	init(modelName: String, fileExtension: String, thumbImageFilename: String, title: String) {
		super.init()
		self.name = "Virtual object root node"
		self.modelName = modelName
		self.fileExtension = fileExtension
		self.thumbImage = UIImage(named: thumbImageFilename)
		self.title = title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func loadModel() {
        guard let virtualObjectScene = SCNScene(named: "\(modelName).\(fileExtension)", inDirectory: "Models.scnassets/\(modelName)") else {
            return
        }
        
        
//        guard let virtualObj = SCNScene.init(named: "Models.scnassets/desk_B.DAE") else {
//            return
//        }
		
		let wrapperNode = SCNNode()
		
		for child in virtualObjectScene.rootNode.childNodes {
			child.geometry?.firstMaterial?.lightingModel = .physicallyBased
			child.movabilityHint = .movable
			wrapperNode.addChildNode(child)
		}
//        wrapperNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
		self.addChildNode(wrapperNode)
		modelLoaded = true
	}
    
    func loadBoxModel() {
        let box = SCNBox.init(width: 0.1, height: 0.002, length: 0.1, chamferRadius: 0.0)
        let node = SCNNode.init(geometry: box)
        let grassImage = UIImage(named: "dalishi")
        let grassMaterial = SCNMaterial()
        grassMaterial.diffuse.contents = grassImage
        grassMaterial.isDoubleSided = true
        box.materials = [grassMaterial]
        self.addChildNode(node)
    }
    
	
	func unloadModel() {
		for child in self.childNodes {
			child.removeFromParentNode()
		}
		
		modelLoaded = false
	}
	
	func translateBasedOnScreenPos(_ pos: CGPoint, instantly: Bool, infinitePlane: Bool) {
		
		guard let controller = viewController else {
			return
		}
		
		let result = controller.worldPositionFromScreenPosition(pos, objectPos: self.position, infinitePlane: infinitePlane)

		controller.moveVirtualObjectToPosition(result.position, instantly, !result.hitAPlane)
	}
}

extension VirtualObject {
	
	static func isNodePartOfVirtualObject(_ node: SCNNode) -> Bool {
		if node.name == "Virtual object root node" {
			return true
		}
		
		if node.parent != nil {
			return isNodePartOfVirtualObject(node.parent!)
		}
		
		return false
	}
	
//    static let availableObjects: [VirtualObject] = [
//        Candle(),
//        Cup(),
//        Vase(),
//        Lamp(),
//        Chair(),
//        Floor(),
//        Desk()
//    ]
    
    static let availableObjects: [VirtualObject] = [
        Desk(),
        OldChair(),
        Bench()
        
    ]
    
}

// MARK: - Protocols for Virtual Objects

protocol ReactsToScale {
	func reactToScale()
}

extension SCNNode {
	
	func reactsToScale() -> ReactsToScale? {
		if let canReact = self as? ReactsToScale {
			return canReact
		}
		
		if parent != nil {
			return parent!.reactsToScale()
		}
		
		return nil
	}
}
