//
//  InfoDetailTableViewController.swift
//  Euro2020App
//
//  Created by Giorgi Gogichaishvili on 6/20/21.
//

import UIKit

class InfoDetailTableViewController: UITableViewController {
     

    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var infoDescriptionTextView: UITextView!
    
var info: Info?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Euro 2020"
        // CC -
        infoImageView.image = info?.image
        infoTitleLabel.text = info?.title
        infoDescriptionTextView.text = info?.description
    }
    //Mark: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            return nil
        }
    }
}


// Mark: - UIScrollViewDelegate
extension InfoDetailTableViewController
{
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        infoDescriptionTextView.resignFirstResponder()

    }
}
