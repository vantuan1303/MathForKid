//
//  ViewController.swift
//  MathForKid
//
//  Created by Nguyen Van Tuan on 12/11/16.
//  Copyright © 2016 MyProjects. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    
    @IBOutlet weak var btn_b1: UIButton!
    @IBOutlet weak var btn_b2: UIButton!
    @IBOutlet weak var btn_b3: UIButton!
    
    @IBOutlet weak var lbl_true: UILabel!
    @IBOutlet weak var lbl_false: UILabel!
    @IBOutlet weak var lbl_oper: UILabel!
    @IBOutlet weak var lbl_time: UILabel!
    
    var trueKQ = 0
    var falseKQ = 0
    var randomBut = 0
    var sumSub = 0
    var timer = NSTimer()
    var startTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counter"), userInfo: nil, repeats: true)
        setRandom()
    }
    
    func counter(){
        startTime += 1
        let min = Int(startTime / 60)
        let second = startTime % 60
        let smin = String(format: "%02d", min)
        let ssecond = String(format: "%02d", second)
        lbl_time.text = String("\(smin):\(ssecond)")
    }
    
    @IBAction func btm_acc1(sender: UIButton) {
        if (randomBut == 1 ){
            trueKQ += 1
        }else{
            falseKQ += 1
        }
        setRandom()
    }

    @IBAction func btn_acc2(sender: UIButton) {
        if (randomBut == 2 ){
            trueKQ += 1
        }else{
            falseKQ += 1
        }
        setRandom()
    }
    
    @IBAction func btn_acc3(sender: UIButton) {
        if (randomBut == 3 ){
            trueKQ += 1
        }else{
            falseKQ += 1
        }
        setRandom()
    }
    
    func trueFalse(trueK: Int, falseK:Int){
        lbl_true.text = String(trueK)
        lbl_false.text = String(falseK)
    }
    
    //Random number
    func setRandom(){
        var x = 0
        sumSub = Int(arc4random_uniform(2))
        var random1 = Int(arc4random_uniform(4)) + 1
        var random2 = Int(arc4random_uniform(4)) + 1
        
        //Neu phep toan la tru va so 2 > so 1
        if (sumSub == 1 && random2 > random1){
            x = random1
            random1 = random2
            random2 = x
            lbl_oper.text = String("-")
        }else if(sumSub == 1){
            lbl_oper.text = String("-")
        }else{
            lbl_oper.text = String("+")
        }
        
        //Show number in view
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        trueFalse(trueKQ, falseK: falseKQ)
        setResuilt(random1, randomB: random2)
    }
    
    func setResuilt(randomA: Int, randomB: Int){
        randomBut = Int(arc4random_uniform(3)) + 1
        var KQ = 0
        //Random ket qua hien thi
        var randomKQ1 = 0
        var randomKQ2 = 0
        if (sumSub == 0){
            KQ = sum(randomA, p2: randomB)
        }else{
            KQ = subt(randomA, p2: randomB)
        }
        
        repeat {
            randomKQ1 = Int(arc4random_uniform(7)) + 1
        } while randomKQ1 == KQ
        
        repeat {
            randomKQ2 = Int(arc4random_uniform(7)) + 1
        } while (randomKQ2 == KQ || randomKQ2 == randomKQ1)
        
        if (randomBut == 1){
            btn_b1.setTitle(String(KQ), forState: .Normal)
            btn_b2.setTitle(String(randomKQ1), forState: .Normal)
            btn_b3.setTitle(String(randomKQ2), forState: .Normal)
        }
        
        if (randomBut == 2){
            btn_b2.setTitle(String(KQ), forState: .Normal)
            btn_b1.setTitle(String(randomKQ1), forState: .Normal)
            btn_b3.setTitle(String(randomKQ2), forState: .Normal)
        }
        
        if (randomBut == 3){
            btn_b3.setTitle(String(KQ), forState: .Normal)
            btn_b2.setTitle(String(randomKQ1), forState: .Normal)
            btn_b1.setTitle(String(randomKQ2), forState: .Normal)
        }
    }
    
    func sum(p1: Int, p2: Int) -> Int{
        return p1 + p2
    }
    
    func subt(p1: Int, p2: Int) -> Int{
        return p1 - p2
    }

}

