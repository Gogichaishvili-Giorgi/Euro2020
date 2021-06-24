//
//  InfoTableViewCell.swift
//  Euro2020App
//
//  Created by Giorgi Gogichaishvili on 6/20/21.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var infoImageView: UIImageView!
    
    
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    var info: Info? {
            didSet {
                self.updateUI()
            }
        }
        func updateUI()
        {
            infoImageView?.image = info?.image
            infoTitleLabel?.text = info?.title

        }
    }


