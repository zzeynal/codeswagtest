//
//  ViewController.swift
//  coder-swag
//
//  Created by Zeynal Zeynalov on 6/12/18.
//  Copyright © 2018 Zeynal Zeynalov. All rights reserved.
//

import UIKit


class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var categoryTable: UITableView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
        
    }

    //Method for identifying number (quantity) of Rows needed for tableView in order to display as much data as per quantity of rows and as much as rows as quantity of data
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
        
    }
    
    // Method to perform followings:
    // - indentify cell For Row at given indexPath
    // - dequeueing of data from database into the reusable constant cell
    // - create constant category with categories for each row
    // - update View of category cells with provision of data at constant categpry
    // - return all above mentioned data into the constant cell
    
    
    //Row display. Implementers should always try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier;
    //Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
            
        }
        else {
            return CategoryCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productVC = segue.destination as? ProductsVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            assert(sender as? Category != nil)
            productVC.initProducts(category: sender as! Category)
            
            
            
        }
    }
}

