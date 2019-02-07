//
//  ViewController.swift
//  PageTransitions
//
//  Created by Richard EV Simpson on 08/01/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

protocol TextTransfer:class {
    var someText: String? { get set }
}

class ViewController: UIViewController, TextTransfer {
    var someText: String?
    

    override func viewWillAppear(_ animated: Bool) {
        if let text = someText {
            print("We are back in ViewController1 with text : \(text)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondeScreenSegue" {
            let controller = segue.destination as! ViewController3
            controller.demoData = sender as? String
        }
    }

    @IBAction func callingSegueButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "secondeScreenSegue", sender: "This is some demo text") // The text from sender will be send to prepare(for segue.... etc) the sender there will be what you set here!!
    }
    
    @IBAction func callingNavigationControllerClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        vc.demoData = "This is some demotext called with presentViewController"
        vc.delegate = self // Extra to simple show how to give data back from the next viewcontroller
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func presentViewControllerClicked(_ sender: Any) {
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func loadWithoutStoryboard(_ sender: Any) {
        self.navigationController!.pushViewController(TestViewController(nibName: "TestViewController", bundle: nil), animated: true)
    }
}

