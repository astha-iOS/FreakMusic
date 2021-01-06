//
//  topCVCell.swift
//  TestApp
//
//  Created by Astha yadav on 01/11/20.
//

import UIKit

class TopCVCell: UICollectionViewCell {
    
    var playClick : (()->())?
    
    @IBOutlet weak var img_view: UIImageView!
    
    @IBOutlet weak var btnPlay: UIButton!
    
    @IBAction func play(_ sender: Any) {
        playClick!()
        
    }
}

