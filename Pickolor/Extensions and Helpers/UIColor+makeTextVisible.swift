//  Created by Kacper Jagiello on 29/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension UIColor {
    
    static func makeTextVisible(on color: UIColor) -> UIColor {
        guard let colorComponents = color.cgColor.components, colorComponents.count >= 3 else { return UIColor.white }

        let red = Float(colorComponents[0])*255
        let green = Float(colorComponents[1])*255
        let blue = Float(colorComponents[2])*255

        switch (red, green, blue) {
        case ((220)..., _, _):
            return UIColor.black
        case (_, (195)..., _):
            return UIColor.black
        default:
            return UIColor.white
        }
    }
}
