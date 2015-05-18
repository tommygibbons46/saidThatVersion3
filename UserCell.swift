//
//  UserCell.swift
//  ParseStarterProject
//
//  Created by Thomas Gibbons on 5/13/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

protocol flaggerDelegate
{
    func toTheUserProfile(yes: Bool, forUser: PassiveUser)
    
    func addFollow(to: PassiveUser, from: PassiveUser)

    func deleteFollow(to: PassiveUser, from: PassiveUser)
}

class UserCell: UITableViewCell
{

    override func awakeFromNib()
    {
        super.awakeFromNib()
        
               // Initialization code
    }

    @IBOutlet weak var followButton2: UIButton!
    
    @IBOutlet weak var userButton2: UIButton!
    
    @IBOutlet weak var profileImage2: UIImageView!
    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var userButton: UIButton!
    var selectedUser : PassiveUser?
    var delegate : flaggerDelegate?
    var theCurrentUser : PassiveUser?
    var isFollowing : Bool?
    var isFollowing2 : Bool?
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBAction func followButtonTap(sender: AnyObject)
    {
        
        if(isFollowing == true)
        {
            self.followButton.setTitle("Follow", forState: UIControlState.Normal)
            delegate?.deleteFollow(selectedUser!, from: theCurrentUser!)
        }
        else
        {
            self.followButton.setTitle("Unfollow", forState: UIControlState.Normal)
            delegate?.addFollow(selectedUser!, from: theCurrentUser!)
        }
    }

    @IBAction func followButton2tap(sender: AnyObject)
    {
        if(isFollowing2 == true)
        {
            self.followButton2.setTitle("Follow", forState: UIControlState.Normal)
            delegate?.deleteFollow(selectedUser!, from: theCurrentUser!)
        }
        else
        {
            self.followButton2.setTitle("Unfollow", forState: UIControlState.Normal)
            delegate?.addFollow(selectedUser!, from: theCurrentUser!)
        }
    }
    
    @IBAction func user2ButtonTap(sender: AnyObject)
    {
        delegate?.toTheUserProfile(true, forUser: self.selectedUser!)
    }

    @IBAction func userButtonTap(sender: AnyObject)
    {
        delegate?.toTheUserProfile(true, forUser: self.selectedUser!)
    }
    
    func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage{
        
        
        var scale = CGFloat(max(size.width/image.size.width,
            size.height/image.size.height))
        var width:CGFloat  = image.size.width * scale
        var height:CGFloat = image.size.height * scale;
        
        var rr:CGRect = CGRectMake( 0, 0, width, height);
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        image.drawInRect(rr)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return newImage
    }
}
