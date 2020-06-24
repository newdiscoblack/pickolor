//  Created by Kacper Jagiello on 28/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class MainMenuInterface: UIView {
    
    let menuButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        return stackView
    }()
    
    let quickEdit: UIButton = {
        let button = UIButton()
        button.frame = CGRect.zero
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 64.0)
        button.setTitle("quick edit", for: .normal)
        return button
    }()

    let myPalettesTitle: UIButton = {
        let button = UIButton()
        button.frame = CGRect.zero
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 64.0)
        button.setTitle("my palettes", for: .normal)
        return button
    }()

    let generatePaletteTitle: UIButton = {
        let button = UIButton()
        button.frame = CGRect.zero
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 64.0)
        button.setTitle("generator", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(quickEdit)
        menuButtons.addArrangedSubview(quickEdit)
        
        quickEdit.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 64, enableInsets: false)
        
        addSubview(myPalettesTitle)
        menuButtons.addArrangedSubview(myPalettesTitle)
        
        myPalettesTitle.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 64, enableInsets: false)

        
        addSubview(generatePaletteTitle)
        menuButtons.addArrangedSubview(generatePaletteTitle)
  
        generatePaletteTitle.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 64, enableInsets: false)
        
        addSubview(menuButtons)
        menuButtons.addArrangedSubview(quickEdit)
        menuButtons.addArrangedSubview(myPalettesTitle)
        menuButtons.addArrangedSubview(generatePaletteTitle)
        
        menuButtons.anchor(top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 150, paddingRight: 20, width: UIScreen.main.bounds.width, height: 0, enableInsets: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
