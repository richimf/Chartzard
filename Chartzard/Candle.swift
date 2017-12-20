//
//  Candle.swift
//  Chartzard
//
//  Created by Richie on 12/20/17.
//  Copyright © 2017 Richie. All rights reserved.
//

import Foundation
import UIKit

class Candle: UIView {
    
    var high:Int8?
    var low:Int8?
    var open:Int8?
    var close:Int8?
    let width:Int = 10
    let maxHeight:Int = 30
    
    enum Tint{
        case red
        case green
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
       
    }
    
    func setTintColor(color:Tint){
        self.tintColor = (color == Tint.green) ? Colors.green() : Colors.red()
    }
    
}
