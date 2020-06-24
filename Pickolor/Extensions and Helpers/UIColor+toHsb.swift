//  Created by Kacper Jagiello on 04/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension UIColor {
    
    var hsb: [CGFloat]? {
        return toHsb()
    }
    
    func toHsb() -> [CGFloat]? {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return [h*360, s*100, b*100]
    }
}
