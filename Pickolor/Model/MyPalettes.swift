//  Created by Kacper Jagiello on 08/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import UIKit

class MyPalettes {
    static let sharedInstance = MyPalettes()
    
    var createdPalettes = [Palette]()
    
//        [Palette(name: "First palette", created: .distantPast, modified: .distantPast, colors: [UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!]),
//        Palette(name: "Second palette", created: .distantPast, modified: .distantPast, colors: [UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!]),
//        Palette(name: "Third palette", created: .distantPast, modified: .distantPast, colors: [UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!]),
//        Palette(name: "Fourth palette", created: .distantPast, modified: .distantPast, colors: [UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!, UIColor.randomColor()!]),
//        Palette(name: "Empty palette", created: .distantPast, modified: .distantPast, colors: [])]

    func getPalettes() -> [Palette] { return createdPalettes }
    
    func add(_ palette: Palette) { createdPalettes.insert(palette, at: 0) }
}
