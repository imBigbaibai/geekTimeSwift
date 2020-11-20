//
//  Tab.swift
//  easyDemo
//
//  Created by admin on 2020/11/19.
//

import Foundation
import UIKit

class Tab: UIView {
    var items: [String]         //选项数量
    var itemButtons: [UIButton] //按钮数量
    var selectedItemButton: UIButton! //选中的按钮

    var indicatorView: UIView!   //下划线

    var selectedColor: UIColor? {
        //属性观察，当属性值改变时，走下面的回调
        //当selectedColor改变时，我们把按钮选中的颜色设为外部设置的颜色
        //如果外部没有改变这个属性，我们就用默认的颜色
        didSet {
            if let color = self.selectedColor {
                self.indicatorView.backgroundColor = color
                itemButtons.forEach { (button) in
                    button.setTitleColor(color, for: .selected)
                }
            } else {
                self.indicatorView.backgroundColor = UIColor.hexColor(0xf8892e)
                itemButtons.forEach { (button) in
                    button.setTitleColor(UIColor.hexColor(0xf8892e), for: .selected)
                }
            }
            
        }
    } //被选中的颜色
    var normalColor: UIColor?   //正常的颜色
    
    //初始化属性值
    init?(items: [String]) {
        if items.count == 0 {
            return nil
        }
        self.items = items

        itemButtons = []
        super.init(frame: .zero)
        self.createViews()


    }
    private func createViews() {
        var lastView: UIView? //最后一个view，判断fram的时候用，我们把每次新建的按钮赋值给lastview，这样frame就永远都是lastView.right
        
        //根据itmes循环创建按钮
        for index in 0..<items.count {
            let button = UIButton(type: .custom)
            button.setTitle(items[index], for: .normal)
            button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
            button.setTitleColor(UIColor.hexColor(0xf8892e), for: .selected)
            self.addSubview(button)
            if index == 0 {
                selectedItemButton = button
                selectedItemButton.isSelected = true
            }
            button.snp.makeConstraints { (make) in
                //如果是第一个按钮,和父视图的最左边贴合
                if index == 0 {
                    make.left.equalToSuperview()
                }else {
                    make.left.equalTo(lastView!.snp.right)
                    make.width.equalTo(lastView!)
                }
                make.top.bottom.equalToSuperview()
                
                //如果是最后一个，就贴右边
                if index == items.count - 1 {
                    make.right.equalToSuperview()
                }
            }
            //循环创建，创建完第一个按钮之后，后面的坐标就会按lastView的right计算
            lastView = button
            button.addTarget(self, action: #selector(didClickButton(sender:)), for: .touchUpInside)
            //创建完的按钮添加到按钮数组
            itemButtons.append(button)
        }
        //创建下划线
        indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.hexColor(0xf8892e)
        self.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { (make) in
            make.centerX.equalTo(selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(84)
            make.height.equalTo(4)
        }
    }
    @objc func didClickButton(sender: UIButton) {
        //guard 当判断条件不成立时，会进入内部，如下就是，当点击的按钮不是选择的按钮的时，不会进入内部，
        //就是说当我们点击除了已经选中的按钮外，才会继续执行下面的代码，否则直接return
        guard sender != selectedItemButton else {
            return
        }
        //将已经选中的按钮置灰，然后把当前点击的按钮点亮，然后再把点击的按钮变为selectedItemButton
        selectedItemButton.isSelected = false
        sender.isSelected = true
        selectedItemButton = sender
        
        //重置下下划线的坐标，因为选中的按钮变了
        self.indicatorView.snp.remakeConstraints { (make) in
            make.centerX.equalTo(selectedItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(84)
            make.height.equalTo(4)
        }
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
