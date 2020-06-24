//  Created by Kacper Jagiello on 28/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.


import UIKit

class ColorEditorInterface: UIView {

    let colorInformation: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .thin)
        return label
    }()
        
    let settingsLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let firstComponent: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .thin)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "RED"
        return label
    }()
    
    let secondComponent: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .thin)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "GREEN"
        return label
    }()
    
    let thirdComponent: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .thin)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "BLUE"
        return label
    }()
    
    let rgbPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(colorInformation)
        addSubview(rgbPickerView)
        
        colorInformation.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 130, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
        rgbPickerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0, height: 0, enableInsets: true)
        
        addSubview(settingsLabels)
        settingsLabels.addArrangedSubview(firstComponent)
        settingsLabels.addArrangedSubview(secondComponent)
        settingsLabels.addArrangedSubview(thirdComponent)
        
        settingsLabels.anchor(top: nil, left: leftAnchor, bottom: rgbPickerView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
