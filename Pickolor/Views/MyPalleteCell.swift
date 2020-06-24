//  Created by Kacper Jagiello on 02/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class MyPalleteCell: UITableViewCell {
    
    private let allCellElements: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let paletteTitle: UILabel = {
        let label = UILabel()
        label.text = "Test pallete title"
        return label
    }()
    
    private let paletteInformation: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let paletteCreated: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let paletteModified: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let colorsInThePalette: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let oneTestColor: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.randomColor()
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(allCellElements)
        
        addElementsToTheView()
        setConstraints()
    }
    
    private func addElementsToTheView() {
        allCellElements.addArrangedSubview(paletteTitle)
        
        allCellElements.addArrangedSubview(paletteInformation)
        paletteInformation.addArrangedSubview(paletteCreated)
        paletteInformation.addArrangedSubview(paletteModified)
        
        allCellElements.addArrangedSubview(colorsInThePalette)
    }
    
    private func setConstraints() {
        allCellElements.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: 0, height: 0, enableInsets: false)
    }
    
    //MARK: updating UI
    func present(_ palette: Palette) {
        presentTitleOf(palette)
        presentColorsOf(palette)
        presentDetailsOf(palette)
    }
    
    private func presentTitleOf(_ palette: Palette) {
        paletteTitle.text = "\(palette.name)"
    }
    
    private func presentColorsOf(_ palette: Palette) {
        for subview in colorsInThePalette.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        for color in palette.colors {
            let colorView: UIView = {
                let view = UIView()
                view.backgroundColor = color
                return view
            }()
            colorsInThePalette.addArrangedSubview(colorView)
        }
    }
    
    private func presentDetailsOf(_ palette: Palette) {
        paletteCreated.text = "Created: \(palette.created)"
        paletteModified.text = "Modified: -"
    }
}
