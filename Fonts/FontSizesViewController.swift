//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by Sergio A. Balderas on 30/06/17.
//  Copyright © 2017 Sergio A. Balderas. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {

  var font: UIFont!
  private static let pointSize: [CGFloat] = [9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144]
  private static let cellIdentifier = "FontNameAndSize"
  
    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.estimatedRowHeight = FontSizesViewController.pointSize[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FontSizesViewController.pointSize.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FontSizesViewController.cellIdentifier, for: indexPath)
    cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
    cell.textLabel?.text = font.fontName
    cell.detailTextLabel?.text = "\(FontSizesViewController.pointSize[indexPath.row]) point"
    
    return cell
  }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
    let pointSize = FontSizesViewController.pointSize[indexPath.row]
    return font.withSize(pointSize)
  }

}