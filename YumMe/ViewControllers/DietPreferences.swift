//
//  DietPreferences.swift
//  YumMe
//
//  Created by Pushpal Patil on 5/13/21.
//

import UIKit

final class DietPreferences: UIView {
    
    private var isChecked = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.label.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemBackground
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setCheck(){
        
        self.isChecked = !isChecked
        
        if isChecked{
            backgroundColor = .systemOrange
        }
        else{
            backgroundColor = .systemBackground
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = UIColor.label.cgColor
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
