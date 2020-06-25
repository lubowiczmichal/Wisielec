//
//  ViewController.swift
//  Wisielec
//
//  Created by Michał Lubowicz on 25/06/2020.
//  Copyright © 2020 Michał Lubowicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Start(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Game") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
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
    func check(litera:Character){
    }
    
    @IBAction func A(_ sender: Any) {
        check(litera: "A")
        A.isEnabled = false
    }
    @IBAction func Ą(_ sender: Any) {
        check(litera: "Ą")
        Ą.isEnabled = false
    }
    @IBAction func B(_ sender: Any) {
        check(litera: "B")
        B.isEnabled = false
    }
    @IBAction func C(_ sender: Any) {
        check(litera: "C")
        C.isEnabled = false
    }
    @IBAction func Ć(_ sender: Any) {
        check(litera: "Ć")
        Ć.isEnabled = false
    }
    @IBAction func D(_ sender: Any) {
        check(litera: "D")
        D.isEnabled = false
    }
    @IBAction func E(_ sender: Any) {
        check(litera: "E")
        E.isEnabled = false
    }
    @IBAction func Ę(_ sender: Any) {
        check(litera: "Ę")
        Ę.isEnabled = false
    }
    @IBAction func F(_ sender: Any) {
        check(litera: "F")
        F.isEnabled = false
    }
    @IBAction func G(_ sender: Any) {
        check(litera: "G")
        G.isEnabled = false
    }
    @IBAction func H(_ sender: Any) {
        check(litera: "H")
        H.isEnabled = false
    }
    @IBAction func I(_ sender: Any) {
        check(litera: "I")
        I.isEnabled = false
    }
    @IBAction func J(_ sender: Any) {
        check(litera: "J")
        J.isEnabled = false
    }
    @IBAction func K(_ sender: Any) {
        check(litera: "K")
        K.isEnabled = false
    }
    @IBAction func L(_ sender: Any) {
        check(litera: "L")
        L.isEnabled = false
    }
    @IBAction func Ł(_ sender: Any) {
        check(litera: "Ł")
        Ł.isEnabled = false
    }
    @IBAction func M(_ sender: Any) {
        check(litera: "M")
        M.isEnabled = false
    }
    @IBAction func N(_ sender: Any) {
        check(litera: "N")
        N.isEnabled = false
    }
    @IBAction func Ń(_ sender: Any) {
        check(litera: "Ń")
        Ń.isEnabled = false
    }
    @IBAction func O(_ sender: Any) {
        check(litera: "O")
        O.isEnabled = false
    }
    @IBAction func Ó(_ sender: Any) {
        check(litera: "Ó")
        Ó.isEnabled = false
    }
    @IBAction func P(_ sender: Any) {
        check(litera: "P")
        P.isEnabled = false
    }
    @IBAction func Q(_ sender: Any) {
        check(litera: "Q")
        Q.isEnabled = false
    }
    @IBAction func R(_ sender: Any) {
        check(litera: "R")
        R.isEnabled = false
    }
    @IBAction func S(_ sender: Any) {
        check(litera: "S")
        S.isEnabled = false
    }
    @IBAction func Ś(_ sender: Any) {
        check(litera: "Ś")
        Ś.isEnabled = false
    }
    @IBAction func T(_ sender: Any) {
        check(litera: "T")
        T.isEnabled = false
    }
    @IBAction func U(_ sender: Any) {
        check(litera: "U")
        U.isEnabled = false
    }
    @IBAction func V(_ sender: Any) {
        check(litera: "V")
        V.isEnabled = false
    }
    @IBAction func W(_ sender: Any) {
        check(litera: "W")
        W.isEnabled = false
    }
    @IBAction func X(_ sender: Any) {
        check(litera: "X")
        X.isEnabled = false
    }
    @IBAction func Y(_ sender: Any) {
        check(litera: "Y")
        Y.isEnabled = false
    }
    @IBAction func Z(_ sender: Any) {
        check(litera: "Z")
        Z.isEnabled = false
    }
    @IBAction func Ź(_ sender: Any) {
        check(litera: "Ź")
        Ź.isEnabled = false
    }
    @IBAction func Ż(_ sender: Any) {
        check(litera: "Ż")
        Ż.isEnabled = false
    }
}

