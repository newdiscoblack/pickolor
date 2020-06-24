//  Created by Kacper Jagiello on 09/06/2020.
//  Copyright © 2020 jagiello.com. All rights reserved.

import Foundation

struct DateObtainer {
    static func today() -> String {
        let formatter = DateFormatter()
        let date = Date()

        formatter.locale = Locale(identifier: "pl_PL")
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        
        return formatter.string(from: date)
    }
}
