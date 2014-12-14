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
    
    var weatherArray: [[Int]] = [[-10, -8, -5, -7], [5, 8, 10, 9], [22, 25, 27, 23]]
    
    var weatherToday: [Int] = [0, 0, 0, 0]
    
    var weatherImageView: UIImageView = UIImageView(frame: CGRectMake(60, 60, 50, 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.view.addSubview(weatherImageView)
        
        simulateWeatherToday()
        
        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func purchaseLemonButtonPressed(sender: AnyObject) {
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
        }
        else {
            showAlertWithText(message: "You don't have enough money!")
        }
        
        updateMainView()
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: AnyObject) {
        if supplies.money >= price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
        }
        else {
            showAlertWithText(message: "You don't have enough money!")
        }
        
        updateMainView()
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: AnyObject) {
        if lemonsToPurchase >= 0 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
        }
        else {
            showAlertWithText(message: "You don't have anything to return!")
        }
        
        updateMainView()
    }
    
    @IBAction func unpurchaseIceCubeButtonPressed(sender: AnyObject) {
        if iceCubesToPurchase >= 0 {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
        }
        else {
            showAlertWithText(message: "You don't have anything to return!")
        }
        
        updateMainView()
    }
    
    
    @IBAction func mixLemonButtonPressed(sender: AnyObject) {
        if supplies.lemons > 0 {
            supplies.lemons -= 1
            lemonsToMix += 1
        }
        else {
            showAlertWithText(message: "You don't have enough inventory!")
        }
        
        updateMainView()
    }
    
    @IBAction func mixIceCubeButtonPressed(sender: AnyObject) {
        if supplies.iceCubes > 0 {
            supplies.iceCubes -= 1
            iceCubesToMix += 1
        }
        else {
            showAlertWithText(message: "You don't have enough inventory!")
        }
        
        updateMainView()
    }
    
    @IBAction func unmixLemonButtonPressed(sender: AnyObject) {
        if lemonsToMix < 0 {
            lemonsToMix -= 1
            supplies.lemons += 1
        }
        else {
            showAlertWithText(message: "You have nothing to un-mix!")
        }
        
        updateMainView()
    }
    
    @IBAction func unmixIceCubeButtonPressed(sender: AnyObject) {
        if iceCubesToMix < 0 {
            iceCubesToMix -= 1
            supplies.iceCubes += 1
        }
        else {
            showAlertWithText(message: "You have nothing to un-mix!")
        }
        
        updateMainView()
        
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        
        let average = findAverage(weatherToday)
        
        let customers  = Int(arc4random_uniform(UInt32(average)))
        println("customers: \(customers)")
        
        let lemonadeRatio = Float(lemonsToMix) / Float(iceCubesToMix)
        println("lemonade ratio: \(lemonadeRatio)")
        
        for x in 0...customers {
            
            let preference = Double(arc4random_uniform(UInt32(100)))/100
            
            if preference < 0.4 && lemonadeRatio > 1 {
                supplies.money += 1
                println("paid")
            }
            else if preference > 0.6 && lemonadeRatio < 1 {
                supplies.money += 1
                println("paid")
            }
            else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
                supplies.money += 1
                println("paid")
            }
            else {
                println("no match, no revenue")
            }
        }
        
        lemonsToPurchase = 0
        iceCubesToPurchase = 0
        lemonsToMix = 0
        iceCubesToMix = 0
        
        simulateWeatherToday()
        
        updateMainView()
    }
    
    func updateMainView() {
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplyCount.text = "\(supplies.lemons) Lemons"
        iceCubeSupplyCount.text = "\(supplies.iceCubes) Ice Cubes"
        
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
    
    func simulateWeatherToday() {
        let index = Int(arc4random_uniform((UInt32(weatherArray.count))))
        
        weatherToday = weatherArray[index]
        
        switch index {
            case 0: weatherImageView.image = UIImage(named: "Cold")
            case 1: weatherImageView.image = UIImage(named: "Mild")
            case 2: weatherImageView.image = UIImage(named: "Warm")
            default: weatherImageView.image = UIImage(named: "Warm")
        }
    }
    
    func findAverage(data:[Int]) -> Int {
        var sum = 0
        
        for x in data {
            sum += x
        }
        
        var average: Double = Double(sum) / Double(data.count)
        var rounded: Int = Int(ceil(average))
        
        return rounded
    }
    
}

