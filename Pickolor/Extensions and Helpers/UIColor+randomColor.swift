//  Created by Kacper Jagiello on 29/05/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor? {
        let randomRed = CGFloat(Float(Int.random(in: 0...255)))/255
        let randomGreen = CGFloat(Float(Int.random(in: 0...255)))/255
        let randomBlue = CGFloat(Float(Int.random(in: 0...255)))/255
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
    }
    
    static func randomColor(withAlpha alpha: CGFloat) -> UIColor? {
        let randomRed = CGFloat(Float(Int.random(in: 0...255)))/255
        let randomGreen = CGFloat(Float(Int.random(in: 0...255)))/255
        let randomBlue = CGFloat(Float(Int.random(in: 0...255)))/255
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: alpha)
    }
}
