//  Created by Kacper Jagiello on 03/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct ColorSettings {
    static var RGBSettings: [Array<Int>] = {
        var red = [Int]()
        var green = [Int]()
        var blue = [Int]()
        
        for value in 0...255 {
            red.append(value)
            green.append(value)
            blue.append(value)
        }
        
        return [red, green, blue]
    }()
    
    static var HSBSettings: [Array<Int>] = {
        var hue = [Int()]
        var saturation = [Int()]
        var brightness = [Int()]
        
        for value in 0...360 {
            hue.append(value)
        }
        
        for value in 0...100 {
            saturation.append(value)
            brightness.append(value)
        }
        
        return [hue, saturation, brightness]
    }()
}
