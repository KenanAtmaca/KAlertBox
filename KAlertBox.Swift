//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.

//  KAlertBox v1.1

import UIKit

enum AlertStatus {
    case success
    case warning
    case error
}

enum AlertStyle {
    case solo
    case action
}

enum AnimationPos {
    case top
    case bottom
    case left
    case right
    case none
}

class AButton:UIButton {
    
    fileprivate var actionTouch:((_ button:UIButton) -> Void)? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtonHandle()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtonHandle() {
        addTarget(self, action: #selector(touchButton(sender:)), for: .touchUpInside)
    }
    
    func touchButton(sender:UIButton) {
        actionTouch!(sender)
    }
}

class KAlertBox: NSObject {
    
    fileprivate var contentView:UIView!
    fileprivate var alertView:UIView!
    fileprivate var backgroundView:CAShapeLayer!
    fileprivate var layoutConst:LayoutConstraints!
    fileprivate var alertStyle:AlertStyle!
    fileprivate var alertStatus:AlertStatus!
    fileprivate var animationPos:AnimationPos!
    
    fileprivate var drawOvalShape:CAShapeLayer!
    fileprivate var drawCenterShape:CAShapeLayer!
    fileprivate var drawView:UIView!
    
    var alertTitle:UILabel!
    var alertSubTitle:UILabel!
    
    var alertOkButton:AButton!
    var alertCancelButton:AButton!
    var alertContinueButton:AButton!
    
    fileprivate var alertTitleStr:String?
    fileprivate var alertSubTitleStr:String?

    fileprivate var alertOkButtonColor:UIColor?
    fileprivate var alertCancelButtonColor:UIColor?
    fileprivate var alertOkButtonTitle:String?
    fileprivate var alertCancelButtonTitle:String?
    
    // Default init
    init(to view: UIView,status: AlertStatus, title:String? , subtitle:String?, animationPosition:AnimationPos,alertStyle:AlertStyle) {
        self.contentView = view
        self.alertStatus = status
        self.alertTitleStr = title
        self.alertSubTitleStr = subtitle
        self.animationPos = animationPosition
        self.alertStyle = alertStyle
    }
    // +Button titles change
    init(to view: UIView,status: AlertStatus, title:String? , subtitle:String?, animationPosition:AnimationPos,buttonActionTitle:String?,buttonCancelTitle:String?) {
        self.contentView = view
        self.alertStatus = status
        self.alertTitleStr = title
        self.alertStyle = AlertStyle.action
        self.alertSubTitleStr = subtitle
        self.animationPos = animationPosition
        self.alertOkButtonTitle = buttonActionTitle
        self.alertCancelButtonTitle = buttonCancelTitle
    }
    // +Button titles,color change
    init(to view: UIView,status: AlertStatus, title:String? , subtitle:String?, animationPosition:AnimationPos,buttonActionTitle:String?,buttonCancelTitle:String?,buttonActionColor:UIColor?,buttonCancelColor:UIColor?) {
        self.contentView = view
        self.alertStatus = status
        self.alertTitleStr = title
        self.alertStyle = AlertStyle.action
        self.alertSubTitleStr = subtitle
        self.animationPos = animationPosition
        self.alertOkButtonTitle = buttonActionTitle
        self.alertCancelButtonTitle = buttonCancelTitle
        self.alertOkButtonColor = buttonActionColor
        self.alertCancelButtonColor = buttonCancelColor
    }
    // Style solo +Button title,color change
    init(to view: UIView,status: AlertStatus, title:String? , subtitle:String?, animationPosition:AnimationPos,buttonActionTitle:String?,buttonActionColor:UIColor?) {
        //solo
        self.contentView = view
        self.alertStatus = status
        self.alertTitleStr = title
        self.alertStyle = AlertStyle.solo
        self.alertSubTitleStr = subtitle
        self.animationPos = animationPosition
        self.alertOkButtonTitle = buttonActionTitle
        self.alertOkButtonColor = buttonActionColor
    }
    
    // Setup conf
    func setup() {
        
        setBackgroundView()
        setAlertView()
        drawAlertStateSymbols()
        addAlertTitles()
        
        setConstraints()
        setViewAnimation()
        
    }
    
    // Alert background view
    private func setBackgroundView() {
        
        let bPath = UIBezierPath(rect: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        
        backgroundView = CAShapeLayer()
        backgroundView.path = bPath.cgPath
        backgroundView.fillColor = UIColor.black.withAlphaComponent(0.4).cgColor
        
        contentView.layer.addSublayer(backgroundView)
        
    }
    
    // Alert View
    private func setAlertView() {
        
        alertView = UIView()
        alertView.backgroundColor = UIColor.RGBcolor(red: 252, green: 252, blue: 252, alpha: 1.0)
        alertView.layer.masksToBounds = false
        alertView.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        alertView.layer.shadowRadius = 10
        alertView.layer.shadowOffset = CGSize.zero
        alertView.layer.shadowOpacity = 20
        alertView.layer.cornerRadius = 7
        alertView.layer.zPosition = 1
        
        contentView.addSubview(alertView)
        
    }
    
    // Alert symbol
    private func drawAlertStateSymbols() {
        
        drawView = UIView()
        drawView.backgroundColor = UIColor.clear
        drawView.layer.zPosition = 1
        drawView.alpha = 0
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: CGSize(width: 90, height: 90)))
        
        let tickPath = UIBezierPath()
        tickPath.move(to: CGPoint(x: -40, y: 40))
        tickPath.addLine(to: CGPoint(x: -60, y: 20))
        tickPath.move(to: CGPoint(x: 0, y: 0))
        tickPath.addLine(to: CGPoint(x: -40, y: 40))
        tickPath.close()
        
        let crossPath = UIBezierPath()
        crossPath.move(to: CGPoint(x: -10, y: 70))
        crossPath.addLine(to: CGPoint(x: -60, y: 20))
        crossPath.move(to: CGPoint(x: -60, y: 70))
        crossPath.addLine(to: CGPoint(x: -10, y: 20))
        crossPath.close()
        
        drawOvalShape = CAShapeLayer()
        drawOvalShape.path = ovalPath.cgPath
        drawOvalShape.fillColor = UIColor.clear.cgColor
        drawOvalShape.lineWidth = 5
        drawOvalShape.strokeEnd = 0
        
        if case alertStatus = AlertStatus.success {
            // success
            
            drawOvalShape.strokeColor = UIColor.RGBcolor(red: 48, green: 255, blue: 83, alpha: 1.0).cgColor
            
            drawCenterShape = CAShapeLayer()
            drawCenterShape.path = tickPath.cgPath
            drawCenterShape.fillColor = UIColor.RGBcolor(red: 48, green: 255, blue: 83, alpha: 1.0).cgColor
            drawCenterShape.strokeColor = UIColor.RGBcolor(red: 48, green: 255, blue: 83, alpha: 1.0).cgColor
            drawCenterShape.position.x = drawOvalShape.position.x + 75
            drawCenterShape.position.y = drawOvalShape.position.y + 25
            drawCenterShape.lineWidth = 2
            drawCenterShape.strokeEnd = 0
            
        } else if case alertStatus = AlertStatus.error {
            // error
            
            drawOvalShape.strokeColor = UIColor.RGBcolor(red: 253, green: 73, blue: 73, alpha: 1.0).cgColor
            
            drawCenterShape = CAShapeLayer()
            drawCenterShape.path = crossPath.cgPath
            drawCenterShape.fillColor = UIColor.RGBcolor(red: 253, green: 73, blue: 73, alpha: 1.0).cgColor
            drawCenterShape.strokeColor = UIColor.RGBcolor(red: 253, green: 73, blue: 73, alpha: 1.0).cgColor
            drawCenterShape.position.x = drawOvalShape.position.x + 80
            drawCenterShape.position.y = drawOvalShape.position.y + 3
            drawCenterShape.lineWidth = 2
            drawCenterShape.strokeEnd = 0
            
        } else if case alertStatus = AlertStatus.warning {
            // warning
            
            drawOvalShape.strokeColor = UIColor.RGBcolor(red: 255, green: 175, blue: 48, alpha: 1.0).cgColor
            
            drawCenterShape = CAShapeLayer()
            drawCenterShape.path = crossPath.cgPath
            drawCenterShape.fillColor = UIColor.RGBcolor(red: 255, green: 175, blue: 48, alpha: 1.0).cgColor
            drawCenterShape.strokeColor = UIColor.RGBcolor(red: 255, green: 175, blue: 48, alpha: 1.0).cgColor
            drawCenterShape.position.x = drawOvalShape.position.x + 80
            drawCenterShape.position.y = drawOvalShape.position.y + 3
            drawCenterShape.lineWidth = 2
            drawCenterShape.strokeEnd = 0
            
        }
        
        drawView.layer.addSublayer(drawCenterShape)
        drawCenterShape.add(addStrokeAnimation(duration: 1.5), forKey: nil)
        
        drawView.layer.addSublayer(drawOvalShape)
        
        contentView.addSubview(drawView)
        
        drawOvalShape.add(addStrokeAnimation(duration: 1.0), forKey: nil)
        drawOvalShape.add(addOpacityAnimation(duration: 1.0), forKey: nil)
        
        
        UIView.animate(withDuration: 2.5, animations: {
            () in
            
            self.drawView.alpha = 1
            
        })
        
        
    }
    
    private func addStrokeAnimation(duration:CFTimeInterval) -> CABasicAnimation {
        
        let sAnim = CABasicAnimation(keyPath: "strokeEnd")
        sAnim.fillMode = kCAFillModeForwards
        sAnim.isRemovedOnCompletion = false
        sAnim.autoreverses = false
        sAnim.duration = duration
        sAnim.toValue = 1
       
        return sAnim
        
    }
    
    private func addOpacityAnimation(duration:CFTimeInterval) -> CABasicAnimation {
        
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        opacityAnim.fillMode = kCAFillModeForwards
        opacityAnim.isRemovedOnCompletion = false
        opacityAnim.repeatCount = Float.infinity
        opacityAnim.autoreverses = true
        opacityAnim.duration = duration
        opacityAnim.toValue = 0.3
        opacityAnim.beginTime = 2
        
        return opacityAnim
    }
    
    private func addAlertTitles() {
        
        alertTitle = UILabel()
        alertTitle.layer.zPosition = 1
        alertTitle.font = UIFont.boldSystemFont(ofSize: 23)
        alertTitle.textAlignment = .center
        alertTitle.lineBreakMode = .byTruncatingTail
        alertTitle.textColor = UIColor.black
        alertTitle.text = self.alertTitleStr ?? ""
        
        alertSubTitle = UILabel()
        alertSubTitle.layer.zPosition = 1
        alertSubTitle.font = UIFont.systemFont(ofSize: 16)
        alertSubTitle.textAlignment = .center
        alertSubTitle.numberOfLines = 2
        alertSubTitle.lineBreakMode = .byWordWrapping
        alertSubTitle.textColor = UIColor.gray
        alertSubTitle.text = self.alertSubTitleStr ?? ""
        
        contentView.addSubview(alertTitle)
        contentView.addSubview(alertSubTitle)
        
    }
    
    private func addAlertButtons() {
        
        alertOkButton = AButton()
        alertOkButton.layer.zPosition = 1
        alertOkButton.backgroundColor = alertOkButtonColor ?? UIColor.RGBcolor(red: 0, green: 200, blue: 250, alpha: 1)
        alertOkButton.setTitle(alertOkButtonTitle ?? "OK!", for: .normal)
        alertOkButton.setTitleColor(UIColor.white, for: .normal)
        alertOkButton.layer.cornerRadius = 10
        alertOkButton.clipsToBounds = true
        
        alertCancelButton = AButton()
        alertCancelButton.layer.zPosition = 1
        alertCancelButton.backgroundColor = alertCancelButtonColor ?? UIColor.RGBcolor(red: 198, green: 198, blue: 198, alpha: 1)
        alertCancelButton.setTitle(alertCancelButtonTitle ?? "Cancel", for: .normal)
        alertCancelButton.setTitleColor(UIColor.white, for: .normal)
        alertCancelButton.layer.cornerRadius = 10
        alertCancelButton.clipsToBounds = true
        
        contentView.addSubview(alertOkButton)
        contentView.addSubview(alertCancelButton)
        
    }
    
    private func addAlertSoloContinueButton() {
        
        alertContinueButton = AButton()
        alertContinueButton.layer.zPosition = 1
        alertContinueButton.backgroundColor = alertOkButtonColor ?? UIColor.RGBcolor(red: 0, green: 200, blue: 250, alpha: 1)
        alertContinueButton.setTitle(alertOkButtonTitle ?? "OK!", for: .normal)
        alertContinueButton.setTitleColor(UIColor.white, for: .normal)
        alertContinueButton.layer.cornerRadius = 10
        alertContinueButton.clipsToBounds = true
        
        contentView.addSubview(alertContinueButton)
        
    }
    
    // MARK: Constraints
    private func setConstraints() {
        
        // Alert Box
        layoutConst = LayoutConstraints(to: contentView)
        layoutConst.size(item: alertView, size: CGSize(width: 300, height: 300))
        layoutConst.centerX(item: alertView, toItem: contentView)
        layoutConst.centerY(item: alertView, toItem: contentView)
        
        // Alert DrawView
        layoutConst.size(item: drawView, size: CGSize(width: 90, height: 90))
        layoutConst.centerX(item: drawView, toItem: alertView)
        layoutConst.top(item: drawView, toItem: alertView, value: 20)
        
        // Alert title
        layoutConst.size(item: alertTitle, size: CGSize(width: 240, height: 25))
        layoutConst.centerX(item: alertTitle, toItem: drawView)
        layoutConst.top(item: alertTitle, toItem: drawView, value: 115)
        
        // Alert SubTitle
        layoutConst.size(item: alertSubTitle, size: CGSize(width: 240, height: 40))
        layoutConst.centerX(item: alertSubTitle, toItem: alertTitle)
        layoutConst.top(item: alertSubTitle, toItem: alertTitle, value: 40)
        
        
        if case alertStyle = AlertStyle.solo {
            // Continue Button
            
            addAlertSoloContinueButton()
            
            layoutConst.size(item: alertContinueButton, size: CGSize(width: 240, height: 40))
            layoutConst.centerX(item: alertContinueButton, toItem: alertSubTitle)
            layoutConst.top(item: alertContinueButton, toItem: alertSubTitle, value: 60)
            
        } else {
            
            addAlertButtons()
            // Alert Ok Button
            
            layoutConst.size(item: alertOkButton, size: CGSize(width: 130, height: 40))
            layoutConst.top(item: alertOkButton, toItem: alertSubTitle, value: 60)
            layoutConst.left(item: alertOkButton, toItem: alertView, value: 15)
            
            // Alert Cancel Button
            
            layoutConst.size(item: alertCancelButton, size: CGSize(width: 130, height: 40))
            layoutConst.top(item: alertCancelButton, toItem: alertSubTitle, value: 60)
            layoutConst.right(item: alertCancelButton, toItem: alertView, value: -15)
            
            
        }
        
        layoutConst.final()
        
    }
    
    private func setViewAnimation() {
        
        alertView.alpha = 0
        
        switch (self.animationPos!) {
        case AnimationPos.bottom:
            alertView.center.y = 700
        case AnimationPos.top:
            alertView.center.y = -700
        case AnimationPos.left:
            alertView.center.x = 0
        case AnimationPos.right:
            alertView.center.x = 400
        case AnimationPos.none:
            alertView.center.x = self.contentView.center.x
            alertView.center.y = self.contentView.center.y
        }
        
        UIView.animate(withDuration: 0.7, animations: {
            () in
          //  self.contentView.layoutIfNeeded()
            self.alertView.alpha = 1
            if self.animationPos! == AnimationPos.bottom || self.animationPos! == AnimationPos.top {
                self.alertView.center.y = self.contentView.center.y
            } else {
                self.alertView.center.x = self.contentView.center.x
            }
        }, completion: nil)
        
    }
    
    func addAction(action:(() -> Void)? = nil) {
        
        if case alertStyle = AlertStyle.action {
            
            if action != nil {
                
                alertOkButton.actionTouch = {
                    alertOkButton -> Void in
                    
                    action!()
                    
                    defer {
                        self.remove()
                    }
                }
            } else {
                
                alertOkButton.actionTouch = {
                    alertOkButton -> Void in
                    
                    self.remove()
                }
                
            }//
            
            alertCancelButton.actionTouch = {
                alertCancelButton -> Void in
                
                self.remove()
            }
            
        } else if case alertStyle = AlertStyle.solo {
            
            if action != nil {
                
                alertContinueButton.actionTouch = {
                    alertContinueButton -> Void in
                    
                    action!()
                    
                    defer {
                        self.remove()
                    }
                }
            } else {
                
                alertContinueButton.actionTouch = {
                    alertContinueButton -> Void in
                    
                    self.remove()
                }
                
            }
        }
        
    }
    
    func remove() {
        
        alertView.removeFromSuperview()
        backgroundView.removeFromSuperlayer()
        layoutConst.clearConstraints()
        drawOvalShape.removeFromSuperlayer()
        drawOvalShape.removeAllAnimations()
        drawCenterShape.removeFromSuperlayer()
        drawCenterShape.removeAllAnimations()
        drawView.removeFromSuperview()
        alertTitle.removeFromSuperview()
        alertSubTitle.removeFromSuperview()
        
        if alertContinueButton == nil  {
            alertOkButton.removeFromSuperview()
            alertCancelButton.removeFromSuperview()
        } else {
            alertContinueButton.removeFromSuperview()
        }
        
    }
    
}//

extension UIColor {
    
    static func RGBcolor(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
        
    }
}
