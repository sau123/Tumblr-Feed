//
//  PhotosViewController.swift
//  TumblrView
//
//  Created by Saumeel Gajera on 7/14/16.
//  Copyright © 2016 walmart. All rights reserved.
//

import UIKit
import AFNetworking
import SVPullToRefresh

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var posts : [NSDictionary]?
    
    
    func onRefresh(refreshControl : UIRefreshControl){
        print("on Refresh ")
        
        
        let clientId = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask =
            session.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                        //  NSLog("response: \(responseDictionary)")
                        let innerResponse = responseDictionary["response"]
                        let posts = innerResponse!["posts"]
                        self.posts = (posts as! [NSDictionary])
                        refreshControl.endRefreshing()
                        
                        self.tableView.reloadData()
                        
                    }
                }
            });
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        normal route for refresh button.
        //        let refreshControl = UIRefreshControl()
        //        refreshControl.addTarget(self, action : #selector(onRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        //        tableView.insertSubview(refreshControl, atIndex: 0)
        
        
        //        tableView.pullToRefreshView
        
//        tableView.pullToRefreshView.arrowColor = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 0.8)
        
        //Infinite scrolling
        tableView.addInfiniteScrollingWithActionHandler({
            
            self.tableView.pullToRefreshView.arrowColor = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 0.8)
            
            let clientId = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
            let url = NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(clientId)")
            let request = NSURLRequest(URL: url!)
            let session = NSURLSession(
                configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
                delegate:nil,
                delegateQueue:NSOperationQueue.mainQueue()
            )
            
            let task : NSURLSessionDataTask =
                session.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in
                    if let data = dataOrNil {
                        if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                            data, options:[]) as? NSDictionary {
                            //  NSLog("response: \(responseDictionary)")
                            let innerResponse = responseDictionary["response"]
                            let posts = innerResponse!["posts"]
                            self.posts = (posts as! [NSDictionary])
                            self.tableView.infiniteScrollingView.stopAnimating()
                            self.tableView.reloadData()

                        }
                    }
                });
            task.resume()
        })
        
        // pull to refresh handler
        tableView.addPullToRefreshWithActionHandler({
            self.tableView.pullToRefreshView.arrowColor = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 0.8)
            
            let clientId = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
            let url = NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(clientId)")
            let request = NSURLRequest(URL: url!)
            let session = NSURLSession(
                configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
                delegate:nil,
                delegateQueue:NSOperationQueue.mainQueue()
            )
            
            let task : NSURLSessionDataTask =
                session.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in
                    if let data = dataOrNil {
                        if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                            data, options:[]) as? NSDictionary {
                            //  NSLog("response: \(responseDictionary)")
                            let innerResponse = responseDictionary["response"]
                            let posts = innerResponse!["posts"]
                            self.posts = (posts as! [NSDictionary])
                            self.tableView.pullToRefreshView.stopAnimating()
                            self.tableView.reloadData()
                        }
                    }
                });
            task.resume()
            
            
        });
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 320
        
        let clientId = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask =
            session.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                        //                            NSLog("response: \(responseDictionary)")
                        let innerResponse = responseDictionary["response"]
                        let posts = innerResponse!["posts"]
                        self.posts = (posts as! [NSDictionary])
                        self.tableView.reloadData()
                    }
                }
            });
        
        task.resume()
    }
    
    // data to be send along for the segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        print("sender : \(sender)")
        
        let destinationViewController = segue.destinationViewController as! PhotoDetailsViewController
        destinationViewController.image = (sender as! PostCell).postImage.image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // no of cells.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    // content in each cell.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostCell
        
        let photos = self.posts![indexPath.section]["photos"] as! [NSDictionary]
        let originalSize = photos[0]["original_size"] as! NSDictionary
        let url = originalSize["url"] as! String
        let urlString = NSURL(string: url)
        cell.postImage.setImageWithURL(urlString!)
        return cell
        
    }
    
    // removing the grayscale after a cell has been clicked.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{ // Default is 1 if not implemented{
        if self.posts == nil {
            return 0
        }
        else{
            return self.posts!.count
        }
    }
    
    // custom view for header. will be adjusted to default or specified header height
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame : CGRect(x: 0, y: 0, width: 320, height: 50))
        headerView.backgroundColor = UIColor(white: 1, alpha: 0.9)
        
        let profileView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        profileView.clipsToBounds = true
        profileView.layer.cornerRadius = 15
        profileView.layer.borderColor = UIColor(white: 0.7, alpha: 0.8).CGColor
        profileView.layer.borderWidth = 1;
        
        let photos = self.posts![section]["photos"] as! [NSDictionary]
        let originalSize = photos[0]["original_size"] as! NSDictionary
        let url = originalSize["url"] as! String
        let urlString = NSURL(string: url)
        profileView.setImageWithURL(urlString!)
        
        let dateString = self.posts![section]["date"] as! String
        let dateLabel = UILabel(frame: CGRect(x: 215, y: 10, width: 150, height: 30))
        dateLabel.text = dateString
        dateLabel.font = dateLabel.font.fontWithSize(10)
        dateLabel.layer.borderColor = UIColor(white: 0.9, alpha: 0.8).CGColor
        
        
        headerView.addSubview(profileView)
        headerView.addSubview(dateLabel)
        
        
        //        cell.postImage.setImageWithURL(urlString!)
        print("dateString : \(dateString)")
        
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 50
    }
    
    
    
    
    
}
