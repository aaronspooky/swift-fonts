//
//  FontListViewController.swift
//  Fonts
//
//  Created by Sergio A. Balderas on 30/06/17.
//  Copyright © 2017 Sergio A. Balderas. All rights reserved.
//

import UIKit

class FontListViewController: UITableViewController {

  var fontNames: [String] = []
  var showsFavorites: Bool = false
  private var cellPointSize: CGFloat!
  private static let cellIdentifier = "FontName"
  
    override func viewDidLoad() {
        super.viewDidLoad()

      let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
      cellPointSize = preferredTableViewFont.pointSize
      tableView.estimatedRowHeight = cellPointSize
      
      if showsFavorites {
        navigationItem.rightBarButtonItem = editButtonItem
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fontNames.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FontListViewController.cellIdentifier, for: indexPath)
    cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
    cell.textLabel?.text = fontNames[indexPath.row]
    cell.detailTextLabel?.text = fontNames[indexPath.row]
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return showsFavorites
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if !showsFavorites {
      return
    }
    if editingStyle == UITableViewCellEditingStyle.delete {
      let favorite = fontNames[indexPath.row]
      FavoritesList.sharedFavoritesList.removeFavorite(fontName: favorite)
      fontNames = FavoritesList.sharedFavoritesList.favorites
      
      tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
  }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    FavoritesList.sharedFavoritesList.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    fontNames = FavoritesList.sharedFavoritesList.favorites
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
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let tableViewCell = sender as! UITableViewCell
    let indexPath = tableView.indexPath(for: tableViewCell)!
    let font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
    
    if segue.identifier == "ShowFontSizes" {
      let sizesVC = segue.destination as! FontSizesViewController
      sizesVC.title = font?.fontName
      sizesVC.font = font
    } else {
      let infoVC = segue.destination as! FontInfoViewController
      infoVC.title = font?.fontName
      infoVC.font = font
      infoVC.favorite = FavoritesList.sharedFavoritesList.favorites.contains((font?.fontName)!)
    }
    
  }
  
  func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
    let fontName = fontNames[indexPath.row]
    return UIFont(name: fontName, size: cellPointSize)
  }
  

}
