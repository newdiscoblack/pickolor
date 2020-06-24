//  Created by Kacper Jagiello on 26/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension UIColor {
    
    var cmyk: [Int]? {
        return toCmyk()
    }
    
    func toCmyk() -> [Int]? {
        guard let colorComponents = cgColor.components, colorComponents.count >= 3 else { return nil }
        
        let r = CGFloat(colorComponents[0])
        let g = CGFloat(colorComponents[1])
        let b = CGFloat(colorComponents[2])
        
        let k = 1-max(r, g, b)
        let c = (1-r-k)/(1-k)
        let m = (1-g-k)/(1-k)
        let y = (1-b-k)/(1-k)

        return [Int(round(c*100)), Int(round(m*100)), Int(round(y*100)), Int(round(k*100))]
    }
}
