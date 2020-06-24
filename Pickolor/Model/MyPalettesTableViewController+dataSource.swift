//  Created by Kacper Jagiello on 02/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension MyPalettesTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let amountOfCreatedPalettes = MyPalettes.sharedInstance.createdPalettes.count
        return amountOfCreatedPalettes
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPalleteCell") as! MyPalleteCell
        cell.present(MyPalettes.sharedInstance.createdPalettes[indexPath.row])
        return cell
    }
}
