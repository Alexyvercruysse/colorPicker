//
//  ViewController.swift
//  colorPicker
//
//  Created by iem on 01/12/2016.
//  Copyright © 2016 VercruysseMazet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ColorPickerDelegate{


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var ok: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func userDidChooseColor(color: UIColor) {
        let oldBackground : UIColor = ok.backgroundColor!
        self.ok.backgroundColor = color
        dismiss(animated: true, completion: nil)
        let alert = UIAlertController(title: "Info", message: "Garder la couleur ?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Non", style: .cancel, handler: {action in self.ok.backgroundColor = oldBackground
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickColor" {
            let destination = segue.destination as! ColorPickerViewController
            destination.delegate = self
        }
    }

}


