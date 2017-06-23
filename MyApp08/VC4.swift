//
//  VC4.swift
//  MyApp08
//
//  Created by iii on 2017/6/23.
//  Copyright © 2017年 iii. All rights reserved.
//

import UIKit

class VC4: UIViewController {

    @IBAction func govc2(_ sender: Any) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2")
        show(vc2!, sender: self)

    }
    
    @IBAction func govc3(_ sender: Any) {
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3")
        show(vc3!, sender: self)
    }
    
}
