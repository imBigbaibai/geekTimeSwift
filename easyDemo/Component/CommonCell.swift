//
//  CommonCell.swift
//  easyDemo
//
//  Created by admin on 2020/11/20.
//

import Foundation
import UIKit

class CommonCell: UIControl {
    //定义属性，我们暴露2个属性，供外部给赋值,因为是外部改变，所以我们添加上属性观察器
    var title: String? {
        didSet {
            self.titleView.text = self.title
        }
    }
    
    var titleImage: UIImage? {
        didSet {
            self.iconImage.image = self.titleImage
        }
    }
    var iconImage: UIImageView
    var titleView: UILabel
    var rightIcon: UIImageView
    
    var bottomLine: UIView
    var hightLightView: UIView//高亮view
    
    override init(frame: CGRect) {
        iconImage = UIImageView()
        titleView = UILabel()
        rightIcon = UIImageView(image: R.image.right1())
        
        bottomLine = UIView()
        hightLightView = UIView()
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setupView()
    }
    
    func setupView() {
        self.addSubview(hightLightView)
        hightLightView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        hightLightView.isHidden = true
        hightLightView.alpha = 0
        hightLightView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        self.addSubview(iconImage)
        iconImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(titleView)
        titleView.textColor = UIColor.hexColor(0x333333)
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(rightIcon)
        rightIcon.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor(white: 0.95, alpha: 1)
        bottomLine.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1 / UIScreen.main.scale)
        }
        
       
    }
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.hightLightView.alpha = 1
                self.hightLightView.isHidden = false
            }else {
                UIView.animate(withDuration: 0.5) {
                    self.hightLightView.alpha = 0
                } completion: { (finished) in
                    self.hightLightView.isHidden = true
                }

            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}







































