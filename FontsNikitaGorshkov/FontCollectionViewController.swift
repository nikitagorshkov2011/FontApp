//
//  ViewController.swift
//  FontsNikitaGorshkov
//
//  Created by Admin on 14/07/2018.
//  Copyright © 2018 nikitagorshkov. All rights reserved.
//

import UIKit

class FontCollectionViewController: UIViewController {
    
    let collectionData = [UIFont.Weight.black : "black", UIFont.Weight.bold : "bold", UIFont.Weight.heavy : "heavy", UIFont.Weight.light : "light", UIFont.Weight.medium : "medium", UIFont.Weight.regular : "regular",  UIFont.Weight.semibold : "semibold", UIFont.Weight.thin : "thin", UIFont.Weight.ultraLight : "ultralight"]
    
    var currentWeight = UIFont.Weight.regular

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }

}

extension FontCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = collectionView.bounds.width / 2 - 5
        let height = collectionView.bounds.height / 4 - 5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentWeight = Array(collectionData.keys)[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FontCell", for: indexPath)
        currentWeight = Array(collectionData.keys)[indexPath.row]
        if let label = cell.viewWithTag(100) as? UILabel {
            let font = UIFont.systemFont(ofSize: 20, weight: currentWeight)
            label.text = font.familyName
            label.font = font
            label.adjustsFontSizeToFitWidth = true
        }
        if let label = cell.viewWithTag(101) as? UILabel {
            let font = UIFont.systemFont(ofSize: 15, weight: currentWeight)
            label.text = collectionData[currentWeight]!
            label.font = font
            label.adjustsFontSizeToFitWidth = true
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let destinationViewController = segue.destination as? FontDetailsViewController {
                destinationViewController.fontWeight = currentWeight
                destinationViewController.weightName = collectionData[currentWeight]!
            }
        }
    }
}
