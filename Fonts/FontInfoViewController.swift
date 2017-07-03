//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by Sergio A. Balderas on 03/07/17.
//  Copyright © 2017 Sergio A. Balderas. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      fontSampleLabel.font = font
//      print(fontSampleLabel)
      fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv" + "WwXxYyZz 0123456789"
      
//      print(fontSizeSlider)
      fontSizeSlider.value = Float(font.pointSize)
      fontSizeLabel.text = "\(Int(font.pointSize))"
      favoriteSwitch.isOn = favorite

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
  
  var font: UIFont!
  var favorite: Bool = false

  @IBOutlet weak var fontSampleLabel: UILabel!
  @IBOutlet weak var fontSizeLabel: UILabel!
  @IBOutlet weak var fontSizeSlider: UISlider!
  @IBOutlet weak var favoriteSwitch: UISwitch!
    
  @IBAction func slideFontSize(_ slider: UISlider) {
    let newSize = roundf(slider.value)
    fontSizeLabel.font = font.withSize(CGFloat(newSize))
    fontSizeLabel.text = "\(Int(newSize))"
  }
  @IBAction func toggleFavorite(_ sender: UISwitch) {
    let favoritesList = FavoritesList.sharedFavoritesList
    if sender.isOn {
      favoritesList.addFavorite(fontName: font.fontName)
    } else {
      favoritesList.removeFavorite(fontName: font.fontName)
    }
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
