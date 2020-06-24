//  Created by Kacper Jagiello on 08/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class CreateEmptyPaletteInterface: UIView {
    
    let interfaceElements: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()

    let newPaletteName: UITextField = {
        let textField = UITextField()
        textField.defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32.0, weight: .thin)]
        textField.attributedPlaceholder = .init(string: "your palette name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32.0, weight: .thin)])
        textField.textAlignment = .center
        return textField
    }()
    
    let createNewPaletteButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32.0)
        button.setTitle("create", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(interfaceElements)
        
        interfaceElements.addArrangedSubview(newPaletteName)
        interfaceElements.addArrangedSubview(createNewPaletteButton)

        interfaceElements.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: UIScreen.main.bounds.width, height: 0, enableInsets: false)
        interfaceElements.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
