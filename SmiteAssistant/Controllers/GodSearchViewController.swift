//
//  GodSearchViewController.swift
//  SmiteAssistant
//
//  Created by Levi Carpenter on 6/11/21.
//

import UIKit

class GodSearchViewController: UIViewController {
    
    @IBOutlet var godsCollectionView: UICollectionView!
    
    var godList: Array<SessionResponse> = []
    var godImageHolders: Array<GodImageHolder> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if godList.count != 0 {
            print("Got god list")
        }
        
        if godImageHolders.count != 0 {
            print("god god Images \(godImageHolders.hasAllImages())")
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        
        godsCollectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)

        godsCollectionView.delegate = self
        godsCollectionView.dataSource = self
    }

}

extension GodSearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        godsCollectionView.deselectItem(at: indexPath, animated: true)
        
        print("Tapped at \(indexPath)")
        print("^^\(godList[indexPath.row].Name ?? "Empty")^^")
    }
}

extension GodSearchViewController: UICollectionViewDataSource {
    func collectionView(_ godsCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return godList.count
    }
    
    func collectionView(_ godsCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = godsCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        
        if (godImageHolders.count != 0) {
            cell.configure(with: godImageHolders[indexPath.row].godIconImage!)
            cell.godNameLabel.text = godList[indexPath.row].Name
        } else {
            cell.backgroundColor = UIColor.blue
        }
        
        return cell
    }
}

extension GodSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 30)
    }
}

extension Array where Element : GodImageHolder {
    func hasAllImages() -> Bool {
        for imgHolder in self {
            if !imgHolder.imagesDownloaded {
                return false
            }
        }
        
        return true
    }
}
