//
//  Math.swift
//  ZingMp3-Animation
//
//  Created by Quang Bach on 3/27/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit
private extension Array {
    var randomElement: Element {
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
}
class Math: UIViewController {

    var time = 10
    var timer = Timer()
    var result: Int!
    var arrayMath = ["+","-","x"]
    
    var point = 0
    var lose = 0
    
    
    
    @IBOutlet weak var so1: UILabel!
    @IBOutlet weak var so2: UILabel!
    @IBOutlet weak var lbMath: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbPoint: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        _ = setRandom()
    }
    // bam vao chua hien dung nhu mong muon
    @IBAction func btn(_ sender: UIButton) {
        if sender.titleLabel?.text == "\(setRandom())"{
            time = 10
            point += 1
            _ = setRandom()
            updateUI()
        }else {
            time = 10
            lose += 1
            _ = setRandom()
            updateUI()
        }
    }
    
    //    func resetTime() {
    //        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
    //        _ = setRandom()
    //    }
    
    func countDown(){
        time -= 1
        lbTime.text = "\(time)"
        if time == 0 {
            time = 10
            lose += 1
            _ = setRandom()
            countDown()
            updateUI()
        }
    }
    
    
    //random A and B
    func setRandom() -> Int{
        var result = 0
        let random1 = Int(arc4random_uniform(4) + 1) // lay so ngau nhien tu 0->3 + 1 = 1->3
        let random2 = Int(arc4random_uniform(4) + 1)
        
        let randomDau = Int(arc4random_uniform(3))
        let dau = arrayMath[randomDau] //random phep tinh
        print("\(random1) \(dau) \(random2)")
        lbMath.text = dau
        // ý nghĩa: check đề phòng trường hợp ra số âm.
        if random1 <= random2 {
            so1.text = "\(random2)"
            so2.text = "\(random1)"
            result = math(p1: random2, p2: random1, dau: dau)
            print(result)
            setResult(result: result)
            return result
        } else {
            so1.text = "\(random1)"
            so2.text = "\(random2)"
            result = math(p1: random1, p2: random2, dau: dau)
            print(result)
            setResult(result: result)
            return result
        }
        
        
    }
    
    //random button title, nhan ket qua tra ve cua setRandom
    func setResult(result: Int) {
        var randomA = Int(arc4random_uniform(5))
        var randomB = Int(arc4random_uniform(5))
        // neu randomA == randomB thi se quay random lai cho toi khi khac nhau
        //dam bao dieu kien khac nhau giua cac lua chon ket qua
        if (randomA == randomB) || randomA == result {
            randomA = Int(arc4random_uniform(5))
            
        } else if (randomB == result) {
            randomB = Int(arc4random_uniform(5))
        } else {
            var arrayResult = [randomA,randomB,result]
            print(arrayResult)
            
            let buttons = [btn1, btn2, btn3]
            //vong lap de lay gia tri random cho button
            // khi chon dc 1 gia tri cho button se xoa gia tri do khoi mang ket qua arrayResult
            for button in buttons {
                let index = Int(arc4random_uniform(UInt32(arrayResult.count)))
                button?.setTitle("\(arrayResult[index])", for: .normal)
                arrayResult.remove(at: index)
            }
        }
    }
    
    //math select...
    func math(p1: Int, p2: Int,dau: String) -> Int {
        switch dau {
        case "+":
            return p1 + p2
        case "-":
            return p1 - p2
        case "x":
            return p1 * p2
        default:
            return 0
        }
    }
    
    
    func updateUI(){
        lbPoint.text = "\(point)"
        lbWrong.text = "\(lose)"
    }


}
