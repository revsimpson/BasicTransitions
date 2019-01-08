//
//  ViewController3.swift
//  PageTransitions
//
//  Created by Richard EV Simpson on 08/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    weak var delegate : TextTransfer?
    
    var demoData : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(demoData)
        delegate?.someText = "This is set in ViewController 3"
    }
}
