//
//  ViewController.swift
//  Wisielec
//
//  Created by Michał Lubowicz on 25/06/2020.
//  Copyright © 2020 Michał Lubowicz. All rights reserved.
//

import UIKit

struct MyVariables {
    static var words:[String] = []
    static var level:String = ""
}


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var categories = ["Rośliny", "Zwierzęta", "Planety"]
    var levels = ["Łatwy", "Normalny", "Trudny"]
    
    @IBOutlet weak var cat: UIPickerView!
    @IBOutlet weak var lvl: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return  categories.count
        }
        else{
            return  levels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return  categories[row]
        }
        else{
            return  levels[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            switch  categories[row] {
            case "Rośliny":
                MyVariables.words = plants
            case "Zwierzęta":
                MyVariables.words = animals
            default:
                MyVariables.words = planets
            }
        }
        else{
            MyVariables.level =  levels[row]
        }
    }
        
    
    
    
    var animals:[String] = ["PIES", "KOT", "ŻYRAFA", "LEW", "NIETOPERZ", "BIZON", "ŻUBR", "NOSOROŻEC", "KANGUR", "KURA", "ORZEŁ", "IGUANA", "PAPUGA", "BŁAZENEK", "SZCZUPAK", "KARP", "WIELORYB"]
    var plants:[String] = ["RÓŻA", "STORCZYK", "TULIPAN", "KAKTUS", "ŚWIERK", "SOSNA", "DĄB", "BRZOZA"]
    var planets:[String] = ["MERKURY", "WENUS", "ZIEMIA", "MARS", "JOWISZ", "SATURN", "URAN", "NEPTUN"]

    var toGuess:String = ""
    var found: [Character] = []
    var fails:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Start(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Game") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
  
    @IBAction func refresh(_ sender: Any) {
        imagesHide()
        fails = 0
        if MyVariables.words.isEmpty {
            MyVariables.words = animals
        }
        if MyVariables.level == "" {
            MyVariables.level = "Normalny"
        }
        toGuess = MyVariables.words[Int.random(in: 0 ..< MyVariables.words.count)]
        found = []
        for _ in 0..<toGuess.count{
            found.append("_")
        }
        Text.text = String(found)
        buttonsEnabled()
    }
    
    
    @IBAction func settings(_ sender: UIButton) {
        buttonsDisabled()
        imagesShow()
    }
    
    @IBAction func color(_ sender: UIButton) {
        
    }
    
   
    func letterClick(letter:Character){
        if toGuess.contains(letter){
            
            for i in 0..<toGuess.count{
                if toGuess[toGuess.index(toGuess.startIndex, offsetBy: i)] == letter {
                    found[i] = letter
                    Text.text = String(found)
                }
            }
            if String(found) == toGuess{
                Text.text = toGuess + "\nWYGRAŁEŚ"
                buttonsDisabled()
            }
        }
        else{
            fails += 1
            switch MyVariables.level {
            case "Łatwy":
                easy(fails: fails)
                break
            case "Normalny":
                normal(fails: fails)
                break
            default:
                difficult(fails: fails)
            }
        }
        
    }
    
    func easy(fails:Int){
        switch fails {
        case 0:
            break
        case 1:
            RBase.isHidden = false
            break
        case 2:
            LBase.isHidden = false
            break
        case 3:
            Vertical.isHidden = false
            break
        case 4:
            Support.isHidden = false
            break
        case 5:
            Horizontal.isHidden = false
            break
        case 6:
            Line.isHidden = false
            break
        case 7:
            Head.isHidden = false
            break
        case 8:
            Body.isHidden = false
            break
        case 9:
            RArm.isHidden = false
            break
        case 10:
            LArm.isHidden = false
            break
        case 11:
            RLeg.isHidden = false
            break
        default:
            LLeg.isHidden = false
            Text.text = toGuess + "\nPRZEGRAŁEŚ"
            buttonsDisabled()
        }
    }
    
    func normal(fails:Int){
        switch fails {
        case 1:
            RBase.isHidden = false
            LBase.isHidden = false
        case 2:
            Vertical.isHidden = false
        case 3:
            Support.isHidden = false
        case 4:
            Horizontal.isHidden = false
        case 5:
            Line.isHidden = false
        case 6:
            Head.isHidden = false
        case 7:
            Body.isHidden = false
        case 8:
            RArm.isHidden = false
            LArm.isHidden = false
        default:
            RLeg.isHidden = false
            LLeg.isHidden = false
            Text.text = toGuess + "\nPRZEGRAŁEŚ"
            buttonsDisabled()
        }
    }
    
    func difficult(fails:Int){
        switch fails {
        case 1:
            RBase.isHidden = false
            LBase.isHidden = false
        case 2:
            Vertical.isHidden = false
        case 3:
            Support.isHidden = false
            Horizontal.isHidden = false
        case 4:
            Line.isHidden = false
            Head.isHidden = false
        case 5:
            Body.isHidden = false
        case 6:
            RArm.isHidden = false
            LArm.isHidden = false
        default:
            RLeg.isHidden = false
            LLeg.isHidden = false
            Text.text = toGuess + "\nPRZEGRAŁEŚ"
            buttonsDisabled()
        }
    }
    
    func imagesHide(){
        LBase.isHidden = true
        RBase.isHidden = true
        Vertical.isHidden = true
        Horizontal.isHidden = true
        Support.isHidden = true
        Line.isHidden = true
        Head.isHidden = true
        Body.isHidden = true
        LArm.isHidden = true
        RArm.isHidden = true
        LLeg.isHidden = true
        RLeg.isHidden = true
    }
    
    func imagesShow(){
        LBase.isHidden = false
        RBase.isHidden = false
        Vertical.isHidden = false
        Horizontal.isHidden = false
        Support.isHidden = false
        Line.isHidden = false
        Head.isHidden = false
        Body.isHidden = false
        LArm.isHidden = false
        RArm.isHidden = false
        LLeg.isHidden = false
        RLeg.isHidden = false
    }
    
    func buttonsEnabled(){
        A.isEnabled = true
        Ą.isEnabled = true
        B.isEnabled = true
        C.isEnabled = true
        Ć.isEnabled = true
        D.isEnabled = true
        E.isEnabled = true
        Ę.isEnabled = true
        F.isEnabled = true
        G.isEnabled = true
        H.isEnabled = true
        I.isEnabled = true
        J.isEnabled = true
        K.isEnabled = true
        L.isEnabled = true
        Ł.isEnabled = true
        M.isEnabled = true
        N.isEnabled = true
        Ń.isEnabled = true
        O.isEnabled = true
        Ó.isEnabled = true
        P.isEnabled = true
        Q.isEnabled = true
        R.isEnabled = true
        S.isEnabled = true
        Ś.isEnabled = true
        T.isEnabled = true
        U.isEnabled = true
        V.isEnabled = true
        W.isEnabled = true
        X.isEnabled = true
        Y.isEnabled = true
        Z.isEnabled = true
        Ź.isEnabled = true
        Ż.isEnabled = true
    }
    
    func buttonsDisabled(){
        A.isEnabled = false
        Ą.isEnabled = false
        B.isEnabled = false
        C.isEnabled = false
        Ć.isEnabled = false
        D.isEnabled = false
        E.isEnabled = false
        Ę.isEnabled = false
        F.isEnabled = false
        G.isEnabled = false
        H.isEnabled = false
        I.isEnabled = false
        J.isEnabled = false
        K.isEnabled = false
        L.isEnabled = false
        Ł.isEnabled = false
        M.isEnabled = false
        N.isEnabled = false
        Ń.isEnabled = false
        O.isEnabled = false
        Ó.isEnabled = false
        P.isEnabled = false
        Q.isEnabled = false
        R.isEnabled = false
        S.isEnabled = false
        Ś.isEnabled = false
        T.isEnabled = false
        U.isEnabled = false
        V.isEnabled = false
        W.isEnabled = false
        X.isEnabled = false
        Y.isEnabled = false
        Z.isEnabled = false
        Ź.isEnabled = false
        Ż.isEnabled = false
    }
    @IBOutlet weak var Text: UILabel!
    
    @IBOutlet weak var LBase: UIImageView!
    @IBOutlet weak var RBase: UIImageView!
    @IBOutlet weak var Vertical: UIImageView!
    @IBOutlet weak var Horizontal: UIImageView!
    @IBOutlet weak var Support: UIImageView!
    @IBOutlet weak var Line: UIImageView!
    @IBOutlet weak var Head: UIImageView!
    @IBOutlet weak var Body: UIImageView!
    @IBOutlet weak var LArm: UIImageView!
    @IBOutlet weak var RArm: UIImageView!
    @IBOutlet weak var LLeg: UIImageView!
    @IBOutlet weak var RLeg: UIImageView!
    
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var Ą: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var Ć: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var Ę: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var H: UIButton!
    @IBOutlet weak var I: UIButton!
    @IBOutlet weak var J: UIButton!
    @IBOutlet weak var K: UIButton!
    @IBOutlet weak var L: UIButton!
    @IBOutlet weak var Ł: UIButton!
    @IBOutlet weak var M: UIButton!
    @IBOutlet weak var N: UIButton!
    @IBOutlet weak var Ń: UIButton!
    @IBOutlet weak var O: UIButton!
    @IBOutlet weak var Ó: UIButton!
    @IBOutlet weak var P: UIButton!
    @IBOutlet weak var Q: UIButton!
    @IBOutlet weak var R: UIButton!
    @IBOutlet weak var S: UIButton!
    @IBOutlet weak var Ś: UIButton!
    @IBOutlet weak var T: UIButton!
    @IBOutlet weak var U: UIButton!
    @IBOutlet weak var V: UIButton!
    @IBOutlet weak var W: UIButton!
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var Y: UIButton!
    @IBOutlet weak var Z: UIButton!
    @IBOutlet weak var Ź: UIButton!
    @IBOutlet weak var Ż: UIButton!
    
  
    
    @IBAction func A(_ sender: Any) {
        letterClick(letter: "A")
        A.isEnabled = false
    }
    @IBAction func Ą(_ sender: Any) {
        letterClick(letter: "Ą")
        Ą.isEnabled = false
    }
    @IBAction func B(_ sender: Any) {
        letterClick(letter: "B")
        B.isEnabled = false
    }
    @IBAction func C(_ sender: Any) {
        letterClick(letter: "C")
        C.isEnabled = false
    }
    @IBAction func Ć(_ sender: Any) {
        letterClick(letter: "Ć")
        Ć.isEnabled = false
    }
    @IBAction func D(_ sender: Any) {
        letterClick(letter: "D")
        D.isEnabled = false
    }
    @IBAction func E(_ sender: Any) {
        letterClick(letter: "E")
        E.isEnabled = false
    }
    @IBAction func Ę(_ sender: Any) {
        letterClick(letter: "Ę")
        Ę.isEnabled = false
    }
    @IBAction func F(_ sender: Any) {
        letterClick(letter: "F")
        F.isEnabled = false
    }
    @IBAction func G(_ sender: Any) {
        letterClick(letter: "G")
        G.isEnabled = false
    }
    @IBAction func H(_ sender: Any) {
        letterClick(letter: "H")
        H.isEnabled = false
    }
    @IBAction func I(_ sender: Any) {
        letterClick(letter: "I")
        I.isEnabled = false
    }
    @IBAction func J(_ sender: Any) {
        letterClick(letter: "J")
        J.isEnabled = false
    }
    @IBAction func K(_ sender: Any) {
        letterClick(letter: "K")
        K.isEnabled = false
    }
    @IBAction func L(_ sender: Any) {
        letterClick(letter: "L")
        L.isEnabled = false
    }
    @IBAction func Ł(_ sender: Any) {
        letterClick(letter: "Ł")
        Ł.isEnabled = false
    }
    @IBAction func M(_ sender: Any) {
        letterClick(letter: "M")
        M.isEnabled = false
    }
    @IBAction func N(_ sender: Any) {
        letterClick(letter: "N")
        N.isEnabled = false
    }
    @IBAction func Ń(_ sender: Any) {
        letterClick(letter: "Ń")
        Ń.isEnabled = false
    }
    @IBAction func O(_ sender: Any) {
        letterClick(letter: "O")
        O.isEnabled = false
    }
    @IBAction func Ó(_ sender: Any) {
        letterClick(letter: "Ó")
        Ó.isEnabled = false
    }
    @IBAction func P(_ sender: Any) {
        letterClick(letter: "P")
        P.isEnabled = false
    }
    @IBAction func Q(_ sender: Any) {
        letterClick(letter: "Q")
        Q.isEnabled = false
    }
    @IBAction func R(_ sender: Any) {
        letterClick(letter: "R")
        R.isEnabled = false
    }
    @IBAction func S(_ sender: Any) {
        letterClick(letter: "S")
        S.isEnabled = false
    }
    @IBAction func Ś(_ sender: Any) {
        letterClick(letter: "Ś")
        Ś.isEnabled = false
    }
    @IBAction func T(_ sender: Any) {
        letterClick(letter: "T")
        T.isEnabled = false
    }
    @IBAction func U(_ sender: Any) {
        letterClick(letter: "U")
        U.isEnabled = false
    }
    @IBAction func V(_ sender: Any) {
        letterClick(letter: "V")
        V.isEnabled = false
    }
    @IBAction func W(_ sender: Any) {
        letterClick(letter: "W")
        W.isEnabled = false
    }
    @IBAction func X(_ sender: Any) {
        letterClick(letter: "X")
        X.isEnabled = false
    }
    @IBAction func Y(_ sender: Any) {
        letterClick(letter: "Y")
        Y.isEnabled = false
    }
    @IBAction func Z(_ sender: Any) {
        letterClick(letter: "Z")
        Z.isEnabled = false
    }
    @IBAction func Ź(_ sender: Any) {
        letterClick(letter: "Ź")
        Ź.isEnabled = false
    }
    @IBAction func Ż(_ sender: Any) {
        letterClick(letter: "Ż")
        Ż.isEnabled = false
    }
}
