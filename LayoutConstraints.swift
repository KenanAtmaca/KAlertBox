//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.
//

import UIKit

final class LayoutConstraints {
    
    
    private(set) var constraints:[NSLayoutConstraint] = []
    fileprivate var view:UIView!
    
    
    init(to view:UIView) {
        self.view = view
    }
    
    // Width
    
    func width(item:UIView,value:CGFloat) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConst = NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: value)
        
        constraints.append(widthConst)
        
    }
    
    // Height
    
    func height(item:UIView,value:CGFloat) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConst = NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: value)
        
        constraints.append(heightConst)
        
    }
    
    // Size
    
    func size(item:UIView,size:CGSize) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConst = NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: size.width)
        let heightConst = NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: size.height)
        
        constraints.append(widthConst)
        constraints.append(heightConst)
        
    }
    
    // Top
    
    func top(item:UIView,toItem:UIView,value:CGFloat) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let topConst = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: toItem, attribute: .top, multiplier: 1.0, constant: value)
        
        constraints.append(topConst)
        
    }
    
    // Bottom
    
    func bottom(item:UIView,toItem:UIView,value:CGFloat) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomConst = NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: toItem, attribute: .bottom, multiplier: 1.0, constant: value)
        
        constraints.append(bottomConst)
        
    }
    
    // Left
    
    func left(item:UIView,toItem:UIView,value:CGFloat) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let leftConst = NSLayoutConstraint(item: item, attribute: .left, relatedBy: .equal, toItem: toItem, attribute: .left, multiplier: 1.0, constant: value)
        
        constraints.append(leftConst)
    }
    
    // Right
    
    func right(item:UIView,toItem:UIView,value:CGFloat) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let rightConst = NSLayoutConstraint(item: item, attribute: .right, relatedBy: .equal, toItem: toItem, attribute: .right, multiplier: 1.0, constant: value)
        
        constraints.append(rightConst)
    }
    
    
    // Center X - Y
    
    func centerX(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let centerXConst = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: toItem, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        constraints.append(centerXConst)
    }
    
    func centerY(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let centerYConst = NSLayoutConstraint(item: item, attribute: .centerY, relatedBy: .equal, toItem: toItem, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        constraints.append(centerYConst)
    }
    
    // Equal Top
    
    func equalTop(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let topEqConst = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: toItem, attribute: .top, multiplier: 1.0, constant: 0.0)
        
        constraints.append(topEqConst)
    }
    
    // Equal Bottom
    
    func equalBottom(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomEqConst = NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: toItem, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        constraints.append(bottomEqConst)
    }
    
    // Equal Left
    
    func equalLeft(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let leftEqConst = NSLayoutConstraint(item: item, attribute: .left, relatedBy: .equal, toItem: toItem, attribute: .left, multiplier: 1.0, constant: 0.0)
        
        constraints.append(leftEqConst)
    }
    
    // Equal Right
    
    func equalRight(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let rightEqConst = NSLayoutConstraint(item: item, attribute: .right, relatedBy: .equal, toItem: toItem, attribute: .right, multiplier: 1.0, constant: 0.0)
        
        constraints.append(rightEqConst)
    }
    
    // Fill Width
    
    func fillWidth(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let fillWidthConst = NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: toItem, attribute: .width, multiplier: 1.0, constant: 0.0)
        
        constraints.append(fillWidthConst)
    }
    
    // Fill Width
    
    func fillHeight(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let fillHeightConst = NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: toItem, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        constraints.append(fillHeightConst)
    }
    
    // Fill
    
    func fill(item:UIView,toItem:UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        
        let fillWidthConst = NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: toItem, attribute: .width, multiplier: 1.0, constant: 0.0)
        let fillHeightConst = NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: toItem, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        constraints.append(fillWidthConst)
        constraints.append(fillHeightConst)
    }
    
    // Add Constraints in View
    
    func final() {
        
         self.view.addConstraints(constraints)
    
    }
    
    // Clear Constraints in View
    
    func clearConstraints() {
        self.view.removeConstraints(constraints)
    }
    
    func clearLastConstraints() {
        self.view.removeConstraint(constraints.last!)
        self.constraints.removeLast()
    }
    
    
    deinit {
        constraints = []
    }
    
}//
