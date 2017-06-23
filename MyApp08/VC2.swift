//
//  VC2.swift
//  MyApp08
//
//  Created by iii on 2017/6/23.
//  Copyright © 2017年 iii. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var labelRand: UILabel!
    
    @IBOutlet weak var labelApp: UILabel!
    private let rand = Int(arc4random_uniform(49))
    
    @IBAction func govc3(_ sender: Any) {
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3")
        show(vc3!, sender: self)
        
    }

    @IBAction func govc4(_ sender: Any) {
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4")
        show(vc4!, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC2: viewDidLoad()")
        labelRand.text = String(rand)
        
        let app = UIApplication.shared.delegate as! AppDelegate
        labelApp.text = String(app.rand)
        
        
        
    }
    
}
