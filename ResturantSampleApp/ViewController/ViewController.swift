//
//  ViewController.swift
//  ResturantSampleApp
//
//  Created by M L Ragul on 10/04/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ViewControllerProtocol,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tblMainHolder: UITableView!
    var variants: MainResult? = nil
    
    var variantDetailsDelegate : VariantsDelegateImpl = VariantsDelegateImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblMainHolder.separatorStyle = .none
        variantDetailsDelegate.viewController = self
        variantDetailsDelegate.getVariantDetail()
        
        
        
        
        variantDetailsDelegate.viewController = self
        variantDetailsDelegate.getVariantDetail()
        
        variantDetailsDelegate.viewController = self
        variantDetailsDelegate.getVariantDetail()
        variantDetailsDelegate.viewController = self
        variantDetailsDelegate.getVariantDetail()
    }
    
    //hlooo
    
    
    func two() {
        print("two")
    }
    

    func rokyMethodtestThird(error: NSError) {
        print("Error")
    }
    
    
    func rokyMethodtest(error: NSError) {
        print("Error")
    }
    
    func rokyMethod(error: NSError) {
        print("Error")
    }
    
    func rokyMethodNeww(error: NSError) {
        print("Error")
    }
    
    func handleErrors(error: NSError) {
        print("Error")
    }
    
    func handleUpdateSuccess(variants: MainResult) {
        
        if (variants.results?.count)! > 0
        {
        self.variants = variants
        self.tblMainHolder.dataSource = self
        self.tblMainHolder.delegate = self
        self.tblMainHolder.separatorStyle = .none
        self.tblMainHolder.reloadData()
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Issue with API", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 105
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.variants?.results?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellIdentifier", for: indexPath) as! CustomCell
        
        let getTemp = self.variants?.results![indexPath.row]
        cell.lblNameVal.text = getTemp?.name
        if getTemp?.opening_hours?.open_now == true
        {
            cell.lblAvailability.text = "Available Now"
        }else
        {
        cell.lblAvailability.text = "Not Available"
        }
        
        if let getRating = getTemp?.rating
        {
            cell.lblRating.text = "\(getRating)"
        }
        else
        {
            cell.lblRating.text = "Not Available"
        }
        
        let joinedTypes = getTemp?.types!.joined(separator: ", ")
        cell.lblFacitities.text = "\(String(describing: joinedTypes!))"
        
        if let path = getTemp?.icon  {
            print(path)
            print("chkPath")
            HttpClient.sharedInstance.requestImage(path: path, completionHandler: {image in
                cell.imgViewHolder.image = image
            })
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let getTemp = self.variants?.results![indexPath.row].geometry?.location
        
        self.tblMainHolder.deselectRow(at: indexPath, animated: false)
        
        weak var vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailedVCScene") as? DetailedVC
        
        vc?.getDestlat = (getTemp?.lat)!
        vc?.getDestlng = (getTemp?.lng)!
        self.navigationController?.pushViewController(vc!, animated: true)
    }


}

