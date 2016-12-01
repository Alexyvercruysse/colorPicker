//
//  ColorPickerViewController.swift
//  colorPicker
//
//  Created by iem on 01/12/2016.
//  Copyright © 2016 VercruysseMazet. All rights reserved.
//

import UIKit

extension UIImage { func getPixelColor(pos: CGPoint) -> UIColor {
    
    let pixelData = self.cgImage!.dataProvider!.data
    let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
    
    let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
    
    let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
    let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
    let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
    let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
    
    return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

class ColorPickerViewController: UIViewController{
    
    var delegate : ColorPickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func orangeClick(_ sender: AnyObject) {
        delegate?.userDidChooseColor(color: Color.orange)
    }
    @IBAction func greenClick(_ sender: AnyObject) {
        delegate?.userDidChooseColor(color: Color.green)
    }



    @IBAction func redClick(_ sender: AnyObject) {
        delegate?.userDidChooseColor(color: Color.red)
    }
    
    
}

struct Color{
    static let red: UIColor = #imageLiteral(resourceName: "red").getPixelColor(pos: CGPoint(x: 5, y: 5))
    static let green: UIColor = #imageLiteral(resourceName: "green").getPixelColor(pos: CGPoint(x: 5, y: 5))
    static let orange : UIColor = #imageLiteral(resourceName: "orange").getPixelColor(pos: CGPoint(x: 5, y: 5))
}


protocol ColorPickerDelegate {
    func  userDidChooseColor(color: UIColor)
}
