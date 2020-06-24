//  Created by Kacper Jagiello on 28/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class ColorEditorViewController: UIViewController {
    
    var addColorDelegate: AddColorDelegate?
    
    private let interface = ColorEditorInterface()

    private var selectedValues = [0, 0, 0, 0] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                let red = Float((self?.selectedValues[0])!)/255
                let green = Float((self?.selectedValues[1])!)/255
                let blue = Float((self?.selectedValues[2])!)/255
                
                self?.selectedColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
            }
        }
    }
    
    private var selectedColor: UIColor? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.view.backgroundColor = self?.selectedColor

                let hexValue = self?.selectedColor?.hex ?? "HEXVALUE"
                let hueValue = self?.selectedColor?.hue ?? "HUEVALUE"
                let cmykValues: String = {
                    var text = ""
                    guard let values = self?.selectedColor?.cmyk else { return "" }
                    for value in values {
                        text += "\(String(value))% "
                    }
                    return text
                }()
                let rgbValues: String = {
                    var text = ""
                    guard let values = self?.selectedColor?.rgb else { return "" }
                    for value in values {
                        text += "\(String(value)) "
                    }
                    return text
                }()
                
                self?.interface.colorInformation.textColor = UIColor.makeTextVisible(on: self?.selectedColor ?? UIColor.white)
                self?.interface.colorInformation.text = "HEX: #\(hexValue)\nHUE: \(hueValue)\nCMYK: \(cmykValues)\nRGB: \(rgbValues)"
                
                self?.navigationItem.rightBarButtonItem?.tintColor = UIColor.makeTextVisible(on: self?.selectedColor ?? UIColor.white)
                self?.navigationItem.leftBarButtonItem?.tintColor = UIColor.makeTextVisible(on: self?.selectedColor ?? UIColor.white)
                
                self?.interface.rgbPickerView.reloadAllComponents()
                
                print(self?.selectedColor?.hsb ?? [])
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view = interface
        view.backgroundColor = .red
        
        interface.rgbPickerView.delegate = self
        interface.rgbPickerView.dataSource = self
        
        selectedValues[0] = Int.random(in: 0...255)
        selectedValues[1] = Int.random(in: 0...255)
        selectedValues[2] = Int.random(in: 0...255)

        interface.rgbPickerView.selectRow(selectedValues[0], inComponent: 0, animated: true)
        interface.rgbPickerView.selectRow(selectedValues[1], inComponent: 1, animated: true)
        interface.rgbPickerView.selectRow(selectedValues[2], inComponent: 2, animated: true)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        doneButton.tintColor = .white
        navigationItem.leftBarButtonItem = doneButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addColor))
        addButton.tintColor = .white
        navigationItem.rightBarButtonItem = addButton
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    @objc private func handleCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addColor() {
        addColorDelegate?.add(selectedColor!)
        navigationController?.popViewController(animated: true)
    }
}

extension ColorEditorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return ColorSettings.RGBSettings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ColorSettings.RGBSettings[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(ColorSettings.RGBSettings[component][row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValues[component] = row
        interface.rgbPickerView.reloadAllComponents()
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: String(row), attributes: [NSAttributedString.Key.foregroundColor: UIColor.makeTextVisible(on: self.selectedColor ?? UIColor.white)])
    }

}
