//
//  ViewController.swift
//  YumMe
//
//  Created by Colleen Ponraj on 3/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    let box1 = DietPreferences(frame: CGRect(x: 70, y: 200, width: 30, height: 30))
    let box2 = DietPreferences(frame: CGRect(x: 70, y: 250, width: 30, height: 30))
    let box3 = DietPreferences(frame: CGRect(x: 70, y: 300, width: 30, height: 30))
    let box4 = DietPreferences(frame: CGRect(x: 70, y: 350, width: 30, height: 30))
    let box5 = DietPreferences(frame: CGRect(x: 70, y: 400, width: 30, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //---------1
        let label1 = UILabel(frame: CGRect(x: 118, y: 196, width: 200, height: 40))
        label1.text = "Pescatrian"
        view.addSubview(label1)
        view.addSubview(box1)
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox1))
        box1.addGestureRecognizer(gesture1)
        
        //---------2
        let label2 = UILabel(frame: CGRect(x: 118, y: 246, width: 200, height: 40))
        label2.text = "Vegetarian"
        view.addSubview(label2)
        view.addSubview(box2)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox2))
        box2.addGestureRecognizer(gesture2)
        
        //---------3
        let label3 = UILabel(frame: CGRect(x: 118, y: 296, width: 200, height: 40))
        label3.text = "Omnivorous"
        view.addSubview(label3)
        view.addSubview(box3)
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox3))
        box3.addGestureRecognizer(gesture3)
        
        //---------4
        let label4 = UILabel(frame: CGRect(x: 118, y: 346, width: 200, height: 40))
        label4.text = "Vegan"
        view.addSubview(label4)
        view.addSubview(box4)
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox4))
        box4.addGestureRecognizer(gesture4)
        
        
        //---------5
        let label5 = UILabel(frame: CGRect(x: 118, y: 396, width: 200, height: 40))
        label5.text = "Gluten Free"
        view.addSubview(label5)
        view.addSubview(box5)
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox5))
        box5.addGestureRecognizer(gesture5)
        
    
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapCheckBox1() {
        box1.setCheck()
    }
    @objc func didTapCheckBox2() {
        box2.setCheck()
    }
    @objc func didTapCheckBox3() {
        box3.setCheck()
    }
    @objc func didTapCheckBox4() {
        box4.setCheck()
    }
    @objc func didTapCheckBox5() {
        box5.setCheck()
    }
}

