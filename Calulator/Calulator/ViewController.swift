//
//  ViewController.swift
//  Calulator
//
//  Created by Shejun on 2022/2/27.
//

import UIKit

class ViewController: UIViewController, BoardButtonInputDelegate {


    let board = Board();
    let screen = Screen();
    
    let calculator = CalculatorEngine();
    var isNew = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        installUI();
        // Do any additional setup after loading the view.
    }
    
    func installUI() {
        self.view.addSubview(board);
        board.delegate = self;
        
        board.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(0);
            maker.height.equalTo(board.superview!.snp.height).multipliedBy(2/3.0);
        }
        
        // screen
        self.view.addSubview(screen);
        screen.snp.makeConstraints { (maker) in
            maker.left.right.top.equalTo(0);
            maker.bottom.equalTo(board.snp.top);
        }
    }

    
    func boardButtonClick(_ content: String) {
        if content == "AC" || content == "Delete" || content == "=" {
            
            switch content {
            case "AC":
                screen.clearContent();
                screen.refreshHistory();
            case "Delete":
                screen.deleteInput();
            case "=":
                let result = calculator.calculatEquation(equation: screen.inputString);
                screen.refreshHistory();

                screen.clearContent();
                screen.inputContent(String(result));
                isNew = true;
            default:
                screen.refreshHistory();
            }
            
        } else {
            if isNew {
                screen.clearContent();
                isNew = false;
            }
            screen.inputContent(content);
        }
    }
    


}

