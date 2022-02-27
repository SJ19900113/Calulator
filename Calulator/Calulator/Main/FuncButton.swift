//
//  FuncButton.swift
//  Calulator
//
//  Created by Shejun on 2022/2/27.
//

import Foundation
import UIKit

class FuncButton: UIButton {
    init() {
        super.init(frame: CGRect.zero);
        
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1).cgColor;
        
        self.setTitleColor(UIColor.orange, for: UIControl.State.normal);
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25);
        self.setTitleColor(UIColor.black, for: UIControl.State.highlighted);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init oder : not used");
    }

}
