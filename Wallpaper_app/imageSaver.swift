//
//  imageSaver.swift
//  Wallpaper
//
//  Created by Sneh Patel on 4/8/20.
//  Copyright © 2020 Sneh Patel. All rights reserved.
//

import Foundation
import UIKit   

class ImageSaver: NSObject {
    var imageSaved = false
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
        
                   
    }

    @objc func saveError(_ image: UIImageView, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        imageSaved = true
//        print("Save finished!")
    
    }
}

