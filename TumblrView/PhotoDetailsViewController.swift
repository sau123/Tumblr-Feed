//
//  PhotoDetailsViewController.swift
//  TumblrView
//
//  Created by Saumeel Gajera on 7/14/16.
//  Copyright © 2016 walmart. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailedPhotoImageView: UIImageView!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action : "goToNextScreen")
        
        detailedPhotoImageView.image = image
        
        detailedPhotoImageView.userInteractionEnabled = true
        detailedPhotoImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func goToNextScreen(){
        print("go to next screen func")
        performSegueWithIdentifier("fullScreenSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
