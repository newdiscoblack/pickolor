//  Created by Kacper Jagiello on 21/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension UIColor {
    
    var hex: String? {
        return toHex()
    }
    
    func toHex() -> String? {
        guard let colorComponents = cgColor.components, colorComponents.count >= 3 else { return nil }
        
        let r = Float(colorComponents[0])
        let g = Float(colorComponents[1])
        let b = Float(colorComponents[2])
        
        return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
}
