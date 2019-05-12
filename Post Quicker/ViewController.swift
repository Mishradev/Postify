//
//  ViewController.swift
//  Post Quicker
//
//  Created by Nitish  Mishra on 11/10/15.
//  Copyright © 2015 Nitish Mishra. All rights reserved.
//

import UIKit
import Social
import MessageUI
import GoogleMobileAds

class ViewController: UIViewController,UINavigationControllerDelegate,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate,UIAlertViewDelegate {
    
   
    
    /*@IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-7784954231687936/9838336403"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
    }*/
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func openTwitterPage(sender: UIButton) {
        
        let twUrl: NSURL = NSURL(string: "twitter://user?screen_name=Nitish_100")!
        let twUrlWeb: NSURL = NSURL(string: "https://twitter.com/Nitish_100")!
        
        if(UIApplication.sharedApplication().canOpenURL(twUrl)) {
            // If user twitter installed
            UIApplication.sharedApplication().openURL(twUrl)
        } else {
            // If user does not have twitter installed
            UIApplication.sharedApplication().openURL(twUrlWeb)
        }
        
    }*/


    
    @IBAction func btnTwitterClicked(_ sender: AnyObject)
    {
        shareTwitter()
    }
    @IBAction func btnFacebookClicked(_ sender: AnyObject)
    {
        shareFacebook()
    }
    
    @IBAction func btniMessageClicked(_ sender: AnyObject)
    {
        shareiMessage()
    }
      
    func shareFacebook()
    {
        let fvc: SLComposeViewController=SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        fvc.completionHandler =
            {
                result -> Void in
                let getResult = result as SLComposeViewControllerResult;
                switch(getResult.rawValue)
                {
                case SLComposeViewControllerResult.done.rawValue:
                    Util .invokeAlertMethod("Warning", strBody: "Post Successfull.", delegate: self)
                case SLComposeViewControllerResult.cancelled.rawValue:
                    Util .invokeAlertMethod("Warning", strBody: "Post Cancelled", delegate: self)
                default:
                    Util .invokeAlertMethod("Warning", strBody: "Error ", delegate: self)
                }
                self.dismiss(animated: true, completion: nil)
        }
        self.present(fvc, animated: true, completion: nil)
        
    }
    
    func shareTwitter()
    {
        let tvc: SLComposeViewController=SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        tvc.completionHandler =
            {
                result -> Void in
                let getResult = result as SLComposeViewControllerResult;
                switch(getResult.rawValue)
                {
                case SLComposeViewControllerResult.done.rawValue:
                    Util .invokeAlertMethod("Warning", strBody: "Post Successfull.", delegate: self)
                case SLComposeViewControllerResult.cancelled.rawValue:
                    Util .invokeAlertMethod("Warning", strBody: "Post Cancelled", delegate: self)
                default:
                    Util .invokeAlertMethod("Warning", strBody: "Error ", delegate: self)
                }
                self.dismiss(animated: true, completion: nil)
        }
        self.present(tvc, animated: true, completion: nil)
      
    }
    
    func shareiMessage()
    {
        let controller: MFMessageComposeViewController=MFMessageComposeViewController()
        if(MFMessageComposeViewController .canSendText())
        {
            controller.delegate=self
            controller.messageComposeDelegate=self
            self.present(controller, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Text messaging is not available", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult)
    {
        switch result.rawValue
        {
        case MessageComposeResult.failed.rawValue:
            Util .invokeAlertMethod("Warning", strBody: "Message failed", delegate: self)
        case MessageComposeResult.sent.rawValue:
            Util .invokeAlertMethod("Success", strBody: "Message sent", delegate: self)
        default:
            Util .invokeAlertMethod("Warning", strBody: "error", delegate: self)
        }
        self.dismiss(animated: false, completion: nil)
    }
    
      
}
