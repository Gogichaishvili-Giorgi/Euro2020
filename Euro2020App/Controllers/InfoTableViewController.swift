//
//  InfoTableViewController.swift
//  Euro2020App
//
//  Created by Giorgi Gogichaishvili on 6/20/21.
//

import UIKit

class InfoTableViewController: UITableViewController {

    var infoLines: [InfoLine] = InfoLine.getInfoLines()
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "Euro 2020"
            
           
            navigationItem.rightBarButtonItem = editButtonItem
        }

        // Mark: UITableViewDataSource
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return infoLines.count
        }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return infoLines[section].infos.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
            let infoLine = infoLines[indexPath.section]
            let infos = infoLine.infos
            let info = infos[indexPath.row]
            cell.info = info
            return cell
            
        }
        // Multiple Sections
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
        {
            let infoLine = infoLines[section]
            return infoLine.name
        }
        // delete Rows
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == .delete {
                // 1 - delete the info from the productLine's products array
                let infoLine = infoLines[indexPath.section]
                infoLine.infos.remove(at: indexPath.row)
                // 2 - update the table view with new data
                //tableView.reloadData()
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        // Moving cells
        override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }
        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
        {
            let infoToMove = infoLines[sourceIndexPath.section].infos[sourceIndexPath.row]
            infoLines[destinationIndexPath.section].infos.insert(infoToMove, at: destinationIndexPath.row)
            infoLines[sourceIndexPath.section].infos.remove(at: sourceIndexPath.row)
        }
        // Mark: - UITableViewDelegate
        var selectedInfo: Info?
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            let infoLine = infoLines[indexPath.section]
            let info = infoLine.infos[indexPath.row]
            selectedInfo = info
            performSegue(withIdentifier: "ShowInfoDetail", sender: nil)
        }
        // Mark: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == "ShowInfoDetail" {
                let infoDetailTVC = segue.destination as! InfoDetailTableViewController
                infoDetailTVC.info = selectedInfo
                
            }
        }
}
