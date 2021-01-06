//
//  DashboardVC.swift
//  TestApp
//
//  Created by Astha yadav on 29/10/20.
//

import UIKit
import AVFoundation


class DashboardVC: UIViewController {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var topCV: UICollectionView!
    
    var audioPlayer = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "song1.mp3", ofType:nil)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        outerView.layer.cornerRadius = 10.0
        outerView.clipsToBounds = true
        audioPlayer.stop()
    }

}

extension DashboardVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
    }
        
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCVCell", for: indexPath as IndexPath) as! TopCVCell
        
        
        
        cell.playClick = {
            
            if cell.btnPlay.currentImage!.isEqual(UIImage(systemName: "play.circle")) {
                
                cell.btnPlay.setImage(UIImage(systemName: "pause.circle"), for: .normal)
                
                let url = URL(fileURLWithPath: self.path)
                do {
                    self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                    self.audioPlayer.play()
                } catch {
                    // couldn't load file :(
                }
            }else{
                
                cell.btnPlay.setImage(UIImage(systemName: "play.circle"), for: .normal)
                self.audioPlayer.stop()
            }
            
        }

        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
                
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: topCV.frame.size.width, height: 200)
    }
    
    
    
}
