//
//  ViewController.swift
//  Wallpaper_app
//
//  Created by Sneh Patel on 4/2/20.
//  Copyright © 2020 Sneh Patel. All rights reserved.
//

import UIKit

class WallpaperTabViewController: UIViewController {
    
    var wallpaperUrl: URL? {
        didSet{
            firstWallpaper.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if firstWallpaper.image == nil{
            fetchImage()
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var firstWallpaper: UIImageView!
    
    //gets the image from the url
    private func fetchImage() {
        if let url = wallpaperUrl {
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContents, url == self?.wallpaperUrl {
                        self?.firstWallpaper.image = UIImage(data: imageData)
                        self?.spinner.stopAnimating() 
                    }   
                }
            }       
        }
    }
    //sets a temporary image while the main thing loads
    override func viewDidLoad() {
        super.viewDidLoad()
        if wallpaperUrl == nil {
            wallpaperUrl = ImageURLs.temporaryImage
        }
    }
    
    //saves the image 
    @IBAction func savePhoto(_ sender: Any) {
        let imageSaver = ImageSaver()
        if let inputImage = firstWallpaper.image {
            imageSaver.writeToPhotoAlbum(image: inputImage)
            //
            //            if imageSaver.imageSaved {
            //                let alertController = UIAlertController(title: "Saved!", message: "Your Wallpaper is saved to Photos.", preferredStyle: UIAlertController.Style.alert)
            //
            //                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            //                present(alertController, animated: true, completion: nil)
            //            }
        }
        
        
        
    }
}

