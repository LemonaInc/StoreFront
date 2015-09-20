//
//  ProfileView.swift
//  Findy
//
//  Created by Oskar Zhang on 9/19/15.
//  Copyright © 2015 FindyTeam. All rights reserved.
//

import Foundation
import UIKit
class ProfileView:UIView {
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var history: UIButton!
    @IBOutlet weak var friends: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    class func loadNib()->ProfileView
    {
        return (UINib(nibName: "ProfileView", bundle: NSBundle.mainBundle()).instantiateWithOwner(self, options: nil).first) as! ProfileView
    }
    override func awakeFromNib() {
        let settingsImage = FAKIonIcons.iosGearOutlineIconWithSize(40).imageWithSize(CGSizeMake(40, 40))
        settings.setImage(settingsImage, forState: UIControlState.Normal)
        let historyImage = FAKIonIcons.iosClockOutlineIconWithSize(40).imageWithSize(CGSizeMake(40, 40))
        history.setImage(historyImage, forState: UIControlState.Normal)
        let friendsImage = FAKIonIcons.iosPeopleOutlineIconWithSize(40).imageWithSize(CGSizeMake(40, 40))
        friends.setImage(friendsImage, forState: UIControlState.Normal)
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 2.0
        profileImage.layer.borderColor = settings.tintColor.CGColor
        self.layer.shadowOpacity = 0.7
    }
}