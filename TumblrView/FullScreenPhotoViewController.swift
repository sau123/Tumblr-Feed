//
//  FullScreenPhotoViewController.swift
//  TumblrView
//
//  Created by Saumeel Gajera on 7/15/16.
//  Copyright © 2016 walmart. All rights reserved.
//

import UIKit

class FullScreenPhotoViewController: UIViewController, UIScrollViewDelegate {
 
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fullScreenImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        fullScreenImage.setImageWithURL(NSURL(string: "https://67.media.tumblr.com/e0af45f3931532a7f44369515c35ddb7/tumblr_oa9xyoF0fq1qggwnvo1_1280.jpg")!)
        
        scrollView.addSubview(fullScreenImage)
        
        // Do any additional setup after loading the view.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.fullScreenImage
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
