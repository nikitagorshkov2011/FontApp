//
//  FontDetailsViewController.swift
//  FontsNikitaGorshkov
//
//  Created by Admin on 14/07/2018.
//  Copyright © 2018 nikitagorshkov. All rights reserved.
//

import UIKit

class FontDetailsViewController: UIViewController {

    @IBOutlet weak var FontFamily: UILabel!
    @IBOutlet weak var FontWeight: UILabel!
    @IBOutlet weak var Example: UILabel!
    @IBOutlet weak var Height: UILabel!
    
    var fontWeight = UIFont.Weight.regular
    var weightName = "regular"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font = UIFont.systemFont(ofSize: 20, weight: fontWeight)
        let heightOfExample = 17
        
        FontFamily.text = font.familyName
        FontFamily.font = font
        FontWeight.text = weightName
        FontWeight.font = font
        Example.text = "Example"
        Example.font = UIFont.systemFont(ofSize: CGFloat(heightOfExample), weight: fontWeight)
        Example.textColor = UIColor.green
        Height.text = "\(heightOfExample)pt"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
