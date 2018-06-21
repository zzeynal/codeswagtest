//
//  CategoryCell.swift
//  coder-swag
//
//  Created by Zeynal Zeynalov on 6/12/18.
//  Copyright © 2018 Zeynal Zeynalov. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!

    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }
    
}
