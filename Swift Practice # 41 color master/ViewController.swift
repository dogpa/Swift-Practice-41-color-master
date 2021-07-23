//
//  ViewController.swift
//  Swift Practice # 41 color master
//
//  Created by CHEN PEIHAO on 2021/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    //變色的view
    @IBOutlet weak var backgroundColorUIview: UIView!
    //pattern的圖層
    @IBOutlet weak var patternUIIMageView: UIImageView!
    
    //神奇寶貝的UIImageVIew
    @IBOutlet weak var pokemonUIImageView: UIImageView!
    //選擇寶可夢的segmentedController
    @IBOutlet weak var pokemonSelectSegmentedController: UISegmentedControl!
    //色違的選項

    @IBOutlet weak var patternSelectSegmentedController: UISegmentedControl!
    
    //slider
    //紅色slider
    @IBOutlet weak var redSlider: UISlider!
    //綠色slider
    @IBOutlet weak var greenSlider: UISlider!
    //藍色slider
    @IBOutlet weak var blueSlider: UISlider!
    //alpha slider
    @IBOutlet weak var alphaSlider: UISlider!
    //色違圖層的alpha slider
    @IBOutlet weak var patternSlider: UISlider!
    
    //label
    //紅色數值label
    @IBOutlet weak var redLabel: UILabel!
    //綠色數值label
    @IBOutlet weak var greenLabel: UILabel!
    //藍色數值label
    @IBOutlet weak var blueLabel: UILabel!
    //alpha數值label
    @IBOutlet weak var alphaLabel: UILabel!
    //pattern alpha數值label
    @IBOutlet weak var patternAlphaLabel: UILabel!
    //色違alpha的「濃度」label
    @IBOutlet weak var patternalphaTitleLabel: UILabel!
    //色違alpha的隨機button
    @IBOutlet weak var patternAlphaButton: UIButton!
    
    //照片ａｒｒａｙ
    let pokemonImageArray = ["pika","ebiu","dragon","dream"]

    //色違ａｒｒａｙ
    let patternArray = ["white","maze","spiral","zebra"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColorUIview.backgroundColor = UIColor(red: 1, green: 220/255, blue: 0, alpha: 1)
        // Do any additional setup after loading the view.
    }

    
    //定義5個會隨slider的值改變label的function
    func LabelOfValueChange () {
        redLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueLabel.text = String(format: "%.0f", blueSlider.value * 255)
        alphaLabel.text = String(format: "%.0f", alphaSlider.value * 255)
        patternAlphaLabel.text = String(format: "%.0f", patternSlider.value * 255)
    }
    
    
    
    //快速輸入RGB值的value用在寶可夢segmented controller的改變
    func speedChangeRGB (red:Float, greeen:Float, blue:Float, alpha:Float) {
        redSlider.value = red
        greenSlider.value = greeen
        blueSlider.value = blue
        alphaSlider.value = alpha
        patternSlider.value = Float(0)
        backgroundcolorchange ()
    }
    
    
    
    
    //定義一個pokemonSelectSegmentedController
    //與pokemonImageArray 連動的function
    //segmentedController選到時變化view的背景顏色
    func pictureChange () {
        let pokemonSegmentNumberinFunction = pokemonSelectSegmentedController.selectedSegmentIndex
        pokemonUIImageView.image = UIImage(named: pokemonImageArray[pokemonSegmentNumberinFunction])
        
        if pokemonSegmentNumberinFunction == 0 {
            
            speedChangeRGB(red: 1, greeen: 0.8627, blue: 0, alpha: 1)

        }else if pokemonSegmentNumberinFunction == 1 {
            speedChangeRGB(red: 0.8627, greeen: 0.5490, blue: 0.19607, alpha: 1)
            
        }else if pokemonSegmentNumberinFunction == 2 {
            speedChangeRGB(red: 0.9137, greeen: 0.5333, blue: 0.2745, alpha: 1)

        }else{
            speedChangeRGB(red: 0.8862, greeen: 0.8745, blue: 0.9411, alpha: 1)

        }
    }
    
    
    
    //定義一個function使用色違圖層的變化patternUIIMageView
    //與patternArray的連動
    func patternViewChange () {
        let patternSegNumber = patternSelectSegmentedController.selectedSegmentIndex
        patternUIIMageView.image = UIImage(named: patternArray[patternSegNumber])
                if patternSegNumber != 0 {
            patternalphaTitleLabel.isHidden = false
            patternSlider.isHidden = false
            patternAlphaLabel.isHidden = false
            patternAlphaButton.isHidden = false
                }else{
            patternalphaTitleLabel.isHidden = true
            patternSlider.isHidden = true
            patternAlphaLabel.isHidden = true
            patternAlphaButton.isHidden = true
                }
    }

    
    //backgroundColor的變化func重複使用於改變slider值後座變化
    func backgroundcolorchange () {
        backgroundColorUIview.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    
    //變更寶可夢照片的SegmentedController的Acton
    @IBAction func pokemonImageChange(_ sender: UISegmentedControl) {
           pictureChange()
    }
    
    //變更色違的圖層
    @IBAction func patternChange(_ sender: UISegmentedControl) {
        patternViewChange()

    }
    
    
    //所有slider拉一起的Action 所有改變透過這個slider去處理
    @IBAction func allSliderValeChange(_ sender: UISlider) {
        backgroundColorUIview.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        LabelOfValueChange()
        if patternSelectSegmentedController.selectedSegmentIndex != 0{
            patternUIIMageView.alpha = CGFloat(patternSlider.value)
        }

    }
    
    //全部隨機
    @IBAction func allRandom(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        alphaSlider.value = Float.random(in: 0...1)
        patternSlider.value = Float.random(in: 0...1)
        backgroundColorUIview.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        LabelOfValueChange()

    }
    
    //紅色隨機
    @IBAction func redColorRandom(_ sender: Any) {
        redSlider.value = Float.random(in: 0...1)
        redLabel.text = String(format: "%.0f", redSlider.value * 255)
        backgroundcolorchange ()
        LabelOfValueChange()
        
    }
    
    
    //綠色隨機
    @IBAction func greenColorRandom(_ sender: Any) {
        greenSlider.value = Float.random(in: 0...1)
        greenLabel.text = String(format: "%.0f", greenSlider.value * 255)
        backgroundcolorchange ()
        LabelOfValueChange()
        
    }
    
    
    //藍色隨機
    @IBAction func blueColorRandom(_ sender: Any) {
            blueSlider.value = Float.random(in: 0...1)
            blueLabel.text = String(format: "%.0f", blueSlider.value * 255)
            backgroundcolorchange ()
            LabelOfValueChange()
            
        
    }
    
    //alpha隨機
    @IBAction func alphaColorRandom(_ sender: Any) {
        alphaSlider.value = Float.random(in: 0...1)
        alphaLabel.text = String(format: "%.0f", alphaSlider.value * 255)
        backgroundcolorchange ()
        LabelOfValueChange()
        
    }
    
    //pattern alpha隨機
    @IBAction func patternAlphaColorRandom(_ sender: Any) {
        patternSlider.value = Float.random(in: 0...1)
        patternAlphaLabel.text = String(format: "%.0f", patternSlider.value * 255)
        patternUIIMageView.alpha = CGFloat(patternSlider.value)
        LabelOfValueChange()
        
        
    }
    
    
    //重置reset回到皮卡丘原始的圖片
    @IBAction func reset(_ sender: Any) {
        redSlider.value = Float(1)
        greenSlider.value = Float(0.86274)
        blueSlider.value = Float(0)
        alphaSlider.value = Float(1)
        patternSlider.value = Float(0)
        backgroundcolorchange ()
        LabelOfValueChange()
        pokemonUIImageView.image = UIImage(named: "pika")
        
    }
    
 
}

