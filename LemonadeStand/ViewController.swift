//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Niraj  on 12/14/14.
//  Copyright (c) 2014 Niraj Pant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneySupplyCount: UILabel!
    @IBOutlet weak var lemonSupplyCount: UILabel!
    @IBOutlet weak var iceCubeSupplyCount: UILabel!
    
    
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var iceCubePurchaseCount: UILabel!
    
    @IBOutlet weak var lemonMixCount: UILabel!
    @IBOutlet weak var iceCubeMixCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func purchaseLemonButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unPurchaseIceCubeButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func mixLemonButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func mixIceCubeButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unmixLemonButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unmixIceCubeButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
    }
    
}

