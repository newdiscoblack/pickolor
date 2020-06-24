//  Created by Kacper Jagiello on 08/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension PaletteTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyPalettes.sharedInstance.createdPalettes[indexOfPresentedPalette ?? 0].colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let randomColor = UIColor.randomColor() ?? UIColor.white
        cell.backgroundColor = MyPalettes.sharedInstance.createdPalettes[indexOfPresentedPalette ?? 0].colors[indexPath.row]
        cell.textLabel?.text = "\(randomColor.hex ?? "#HEXVALUE")"
        return cell
    }
}
