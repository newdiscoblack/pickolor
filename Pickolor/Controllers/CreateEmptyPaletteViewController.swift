//  Created by Kacper Jagiello on 08/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class CreateEmptyPaletteViewController: UIViewController {
    
    var creationDelegate: CreateEmptyPaletteDelegate?
    
    private let interface = CreateEmptyPaletteInterface()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
        
        view = interface
        
        self.interface.backgroundColor = UIColor.randomColor()
        
        UIView.animate(withDuration: 7, delay: 0, options: [.repeat, .allowUserInteraction, .autoreverse], animations: {
            let newColor = UIColor.randomColor()
            self.interface.backgroundColor = newColor
        })
        
        self.interface.createNewPaletteButton.addTarget(self, action: #selector(createNewPalette), for: .touchUpInside)
    }
    
    @objc func createNewPalette() {
        let preferredName = interface.newPaletteName.text
        creationDelegate?.create(Palette(name: preferredName ?? "no name", created: DateObtainer.today(), modified: "-", colors: []))
        navigationController?.popViewController(animated: true)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .clear
    }
}
