//  Created by Kacper Jagiello on 27/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class PaletteTableViewController: UITableViewController {
    
    var indexOfPresentedPalette: Int?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.randomColor()]
        
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @objc func addColor() {
        let target = ColorEditorViewController()
        target.addColorDelegate = self
        navigationController?.pushViewController(target, animated: true)
    }
    
    //MARK: supporting methods
    private func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(.none, for: .default)
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let indexOfPresentedPalette = indexOfPresentedPalette else { return navigationItem.title = "error" }
        navigationItem.title = MyPalettes.sharedInstance.createdPalettes[indexOfPresentedPalette].name
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addColor))
        navigationItem.rightBarButtonItem = addButton
    }
}

extension PaletteTableViewController: AddColorDelegate {
    func add(_ color: UIColor) {
        MyPalettes.sharedInstance.createdPalettes[indexOfPresentedPalette ?? 0].colors.insert(color, at: 0)
    }
}

    
