//
//  SHCircularButton.swift
//  SideMenu
//
//  Created by ODA on 22/03/18.
//  Copyright © 2018 ODA. All rights reserved.
//

import UIKit

@IBDesignable
open class SHCircularButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("MyTitle", for: .normal)
        setTitleColor(UIColor.blue, for: .normal)
        //        self.layer.cornerRadius = frame.size.height/2
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.frame.size.height/2// self.cornerRadius
        }
    }
    
}
