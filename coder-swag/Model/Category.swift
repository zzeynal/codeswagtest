//
//  Category.swift
//  coder-swag
//
//  Created by Zeynal Zeynalov on 6/14/18.
//  Copyright © 2018 Zeynal Zeynalov. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title:  String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }


}
