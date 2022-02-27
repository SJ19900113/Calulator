//
//  Board.swift
//  Calulator
//
//  Created by Shejun on 2022/2/27.
//

import Foundation
import SnapKit

protocol BoardButtonInputDelegate {
    func boardButtonClick(_ content: String);
}

class Board: UIView {
    
    var delegate: BoardButtonInputDelegate?;
    
    var dataArray: Array<String> = ["0",".","%","=",
                                    "1","2","3","+",
                                    "4","5","6","-",
                                    "7","8","9","*",
                                    "AC","Delete","^","/"];
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        installUI();
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init oder : not used");
    }
    
    func installUI() {
        var frontBtn:FuncButton!;
        for index in 0..<20 {
            let btn = FuncButton();
            self.addSubview(btn);
            
            btn.snp.makeConstraints { (maker) in
                // 每行第一个
                if index%4 == 0 {
                    maker.left.equalTo(0);
                } else {
                    maker.left.equalTo(frontBtn.snp.right);
                }

                // 第一行
                if index/4 == 0 {
                    maker.bottom.equalTo(0);
                } else if index%4 == 0 {
                    maker.bottom.equalTo(frontBtn.snp.top);
                } else {
                    maker.bottom.equalTo(frontBtn.snp.bottom);
                }
                
                maker.width.equalTo(btn.superview!.snp.width).multipliedBy(0.25);
                maker.height.equalTo(btn.superview!.snp.height).multipliedBy(0.2);
                
                btn.tag = index+100;
                
                btn.addTarget(self, action: #selector(btnClick(button:)), for: .touchUpInside);
                btn.setTitle(dataArray[index], for: .normal);
                
                frontBtn = btn;
            }
        }
    }
    
    @objc func btnClick(button: FuncButton) {
        print(button.title(for: .normal) as Any);
        if (delegate != nil) {
            delegate?.boardButtonClick(button.currentTitle!);
        }
    }
}
