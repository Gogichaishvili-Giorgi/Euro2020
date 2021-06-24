//
//  Info.swift
//  Euro2020App
//
//  Created by Giorgi Gogichaishvili on 6/20/21.
//

import UIKit


class Info {
    var image: UIImage
    var title: String
    var description: String
    init(titled: String, description: String, imageName: String)
{
    self.title = titled
    self.description = description
    if let image = UIImage(named: imageName) {
        self.image = image
    } else {
        self.image = UIImage(named: "image")!
    }
    
}
}
