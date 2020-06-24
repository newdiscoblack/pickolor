//  Created by Kacper Jagiello on 27/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension UIColor {
    
    var rgb: [Int]? {
        return toRgb()
    }
    
    func toRgb() -> [Int]? {
        guard let colorComponents = cgColor.components, colorComponents.count >= 3 else { return nil }
        
        let r = CGFloat(colorComponents[0])*255
        let g = CGFloat(colorComponents[1])*255
        let b = CGFloat(colorComponents[2])*255
        
        return [Int(r), Int(g), Int(b)]
    }
    
}
