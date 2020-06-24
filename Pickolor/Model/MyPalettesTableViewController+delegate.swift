//  Created by Kacper Jagiello on 08/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension MyPalettesTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let target = PaletteTableViewController()
        target.indexOfPresentedPalette = indexPath.row
        navigationController?.pushViewController(target, animated: true)
    }
}
