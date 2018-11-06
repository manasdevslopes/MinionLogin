//
//  SuccessVC.swift
//  MinionLogin
//
//  Created by MANAS VIJAYWARGIYA on 01/09/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class SuccessVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storageRef = Storage.storage().reference()
        
        let tempImage = storageRef.child("images/myimage.jpeg")
        
        //code to upload
//        let image = UIImage(named: "image.jpeg")
//        let metaData = StorageMetadata()
//        metaData.contentType = "image/jpeg"
//        
//        tempImage.putData(UIImageJPEGRepresentation(image!, 0.2)!, metadata: metaData) { (data, error) in
//            if error != nil {
//                print(error?.localizedDescription)
//            }else{
//                print("Upload Done")
//            }
//        }
        
        //getting the image
        tempImage.getData(maxSize: 1*1024*1024) { (data, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                self.imageView.image = UIImage(data: data!)
            }
        }
        
        
        
        
        
        
        
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
