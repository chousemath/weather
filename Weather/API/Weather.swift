//
//  Weather.swift
//  Weather
//
//  Created by Joseph Sungpil Choi on 14/07/2018.
//  Copyright © 2018 Joseph Sungpil Choi. All rights reserved.
//

import Foundation

struct Weather {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [Any]
}

struct Forecast {
    let dt: Any
}
