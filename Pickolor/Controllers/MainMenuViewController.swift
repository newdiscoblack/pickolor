//  Created by Kacper Jagiello on 28/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class MainMenuViewController: UIViewController {

    private let interface = MainMenuInterface()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view = interface
        
        navigationController?.navigationBar.isHidden = true
                
        changeBackground()
        
        interface.quickEdit.addTarget(self, action: #selector(presentQuickEdit), for: .touchUpInside)
        interface.myPalettesTitle.addTarget(self, action: #selector(testPresentation), for: .touchUpInside)

        UIView.animate(withDuration: 7, delay: 0, options: [.repeat, .allowUserInteraction, .autoreverse], animations: {
            let newColor = UIColor.randomColor()
            self.interface.backgroundColor = newColor
            self.interface.quickEdit.setTitleColor(UIColor.makeTextVisible(on: newColor!), for: .normal)
            self.interface.myPalettesTitle.setTitleColor(UIColor.makeTextVisible(on: newColor!), for: .normal)
            self.interface.generatePaletteTitle.setTitleColor(UIColor.makeTextVisible(on: newColor!), for: .normal)
        })
    }
    
    func changeBackground() {
        self.interface.backgroundColor = UIColor.randomColor()
        self.interface.quickEdit.setTitleColor(UIColor.makeTextVisible(on: self.view.backgroundColor!), for: .normal)
        self.interface.myPalettesTitle.setTitleColor(UIColor.makeTextVisible(on: self.view.backgroundColor!), for: .normal)
        self.interface.generatePaletteTitle.setTitleColor(UIColor.makeTextVisible(on: self.view.backgroundColor!), for: .normal)
    }
    
    @objc func testPresentation() {
        let target = MyPalettesTableViewController()
        navigationController?.pushViewController(target, animated: true)
    }
    
    @objc func presentQuickEdit() {
        let target = ColorEditorViewController()
        navigationController?.pushViewController(target, animated: true)
    }
}
