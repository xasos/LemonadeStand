//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Niraj Pant on 12/14/14.
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
    
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    var price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNameView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func purchaseLemonButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unpurchaseIceCubeButtonPressed(sender: AnyObject) {
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
    
    func updateNameView() {
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplyCount.text = "\(supplies.lemons)"
        iceCubeSupplyCount.text = "\(supplies.iceCubes)"
        
        lemonPurchaseCount.text = "\(lemonsToPurchase)"
        iceCubePurchaseCount.text = "\(iceCubesToPurchase)"
        
        lemonMixCount.text = "\(lemonsToMix)"
        iceCubeMixCount.text = "\(iceCubesToMix)"
    }
    
    func showAlertWithText(header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

