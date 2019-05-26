//
//  until.swift
//  Post Quicker
//
//  Created by Nitish  Mishra on 11/10/15.
//  Copyright © 2015 Nitish Mishra. All rights reserved.
//
import UIKit

class Util: NSObject
{
    class func invokeAlertMethod(_ strTitle: String, strBody: String, delegate: AnyObject?) {
        let alert: UIAlertView = UIAlertView()
        alert.message = strBody
        alert.title = strTitle
        alert.delegate = delegate
        alert.addButton(withTitle: "Ok")
        alert.show()
    }
    
}
