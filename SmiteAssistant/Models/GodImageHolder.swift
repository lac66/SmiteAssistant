//
//  GodImageHolder.swift
//  SmiteAssistant
//
//  Created by Levi Carpenter on 6/11/21.
//

import Foundation
import UIKit

class GodImageHolder {
    let id: Int
    let IMAGESTODOWNLOAD: Int = 7
    var imagesDownloaded: Bool = false
    var imgDownloadCount: Int = 0
    // urls
    let godAbility1ImageString: String
    let godAbility2ImageString: String
    let godAbility3ImageString: String
    let godAbility4ImageString: String
    let godAbility5ImageString: String
    let godCardImageString: String
    let godIconImageString: String
    // images
    var godAbility1Image: UIImage?
    var godAbility2Image: UIImage?
    var godAbility3Image: UIImage?
    var godAbility4Image: UIImage?
    var godAbility5Image: UIImage?
    var godCardImage: UIImage?
    var godIconImage: UIImage?
    
    init(id: Int, ability1URL: String, ability2URL: String, ability3URL: String, ability4URL: String, ability5URL: String, godCardURL: String, godIconURL: String) {
        self.id = id
        self.godAbility1ImageString = ability1URL
        self.godAbility2ImageString = ability2URL
        self.godAbility3ImageString = ability3URL
        self.godAbility4ImageString = ability4URL
        self.godAbility5ImageString = ability5URL
        self.godCardImageString = godCardURL
        self.godIconImageString = godIconURL
    }
    
//    func getImages() {
//        self.godAbility1Image = self.godAbility1ImageString.downloadImage()
//        self.godAbility2Image = self.godAbility2ImageString.downloadImage()
//        self.godAbility3Image = self.godAbility3ImageString.downloadImage()
//        self.godAbility4Image = self.godAbility4ImageString.downloadImage()
//        self.godAbility5Image = self.godAbility5ImageString.downloadImage()
//        self.godCardImage = self.godCardImageString.downloadImage()
//        self.godIconImage = self.godIconImageString.downloadImage()
//    }
    
    func getImages() {
        self.godAbility1ImageString.downloadImage(imageHolder: self, position: 0)
        self.godAbility2ImageString.downloadImage(imageHolder: self, position: 1)
        self.godAbility3ImageString.downloadImage(imageHolder: self, position: 2)
        self.godAbility4ImageString.downloadImage(imageHolder: self, position: 3)
        self.godAbility5ImageString.downloadImage(imageHolder: self, position: 4)
        self.godCardImageString.downloadImage(imageHolder: self, position: 5)
        self.godIconImageString.downloadImage(imageHolder: self, position: 6)
    }
    
    func saveImage(position: Int, data: Data) {
        switch position {
            case 0:
                self.godAbility1Image = UIImage(data: data)
                break
            case 1:
                self.godAbility2Image = UIImage(data: data)
                break
            case 2:
                self.godAbility3Image = UIImage(data: data)
                break
            case 3:
                self.godAbility4Image = UIImage(data: data)
                break
            case 4:
                self.godAbility5Image = UIImage(data: data)
                break
            case 5:
                self.godCardImage = UIImage(data: data)
                break
            case 6:
                self.godIconImage = UIImage(data: data)
                break
            default:
                // todo
                // throw out of bounds error
                break
        }
        
        imgDownloadCount += 1
        if (imgDownloadCount == IMAGESTODOWNLOAD) {
            imagesDownloaded = true
        }
        
    }
}

extension String {
    func downloadImage(imageHolder: GodImageHolder, position: Int) {
        let url = URL(string: self)
        print("Download Started")
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url!.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() {
                imageHolder.saveImage(position: position, data: data)
            }
        }
        
        dataTask.resume()
    }
}
