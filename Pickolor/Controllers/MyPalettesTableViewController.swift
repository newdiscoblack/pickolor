//  Created by Kacper Jagiello on 02/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class MyPalettesTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
        
        tableView.register(MyPalleteCell.self, forCellReuseIdentifier: "MyPalleteCell")
        tableView.reloadData()

        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.randomColor()]
    }
    
    //MARK: supporting functions
    private func setupNavigationBar() {
        navigationItem.title = "my palettes"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(.none, for: .default)
        navigationController?.navigationBar.backgroundColor = .white
        
        let addPaletteButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEmptyPalette))
        navigationItem.rightBarButtonItem = addPaletteButton
    }
    
    @objc func addEmptyPalette() {
        let target = CreateEmptyPaletteViewController()
        target.creationDelegate = self
        navigationController?.pushViewController(target, animated: true)
    }
}

extension MyPalettesTableViewController: CreateEmptyPaletteDelegate {
    func create(_ palette: Palette) {
        MyPalettes.sharedInstance.add(palette)
    }
}
