//  Created by Kacper Jagiello on 26/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension UIColor {
    
    var hue: String? {
        return toHue()
    }
    
    func toHue() -> String? {
        guard let colorComponents = cgColor.components, colorComponents.count >= 3 else { return nil }
        
        let r = CGFloat(colorComponents[0])
        let g = CGFloat(colorComponents[1])
        let b = CGFloat(colorComponents[2])
        
        let highestValue = CGFloat(max(r, g, b))
        let lowestValue = CGFloat(min(r, g, b))
        
        let delta = highestValue - lowestValue
        
        var hue: CGFloat = 0
        
        if delta != 0 {
            if r == highestValue {
                hue = (g-b)/delta
            } else if g == highestValue {
                hue = 2+(b-r)/delta
            } else {
                hue = 4+(r-g)/delta
            }
            hue *= 60
            
            if hue < 0 {
                hue += 360
            }
        }
        
        return String(Int(hue))
    }
    
}
