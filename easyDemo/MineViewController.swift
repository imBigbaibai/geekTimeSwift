//
//  MineViewController.swift
//  easyDemo
//
//  Created by admin on 2020/10/30.
//

import UIKit

class MineViewController: BaseViewController {
    
    var topView: UIView!
    var accountCell: CommonCell!
    var buyCell: CommonCell!
    var orderCell: CommonCell!
    var mygroupCell: CommonCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"
        creatTop()
        creatCell()
        // Do any additional setup after loading the view.
    }
    
    private func creatTop() {
        topView = UIView()
        topView.backgroundColor = UIColor.white
        view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        let headPicture = UIImageView(image: R.image.jumkJpg())
        headPicture.layer.masksToBounds = true
        headPicture.layer.cornerRadius = 70
        topView.addSubview(headPicture)
        headPicture.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(140)
        }
        
        let headTitle = UILabel()
        headTitle.text = "点击登录"
        headTitle.textColor = UIColor.black
        headTitle.font = UIFont.systemFont(ofSize: 18)
        topView.addSubview(headTitle)
        headTitle.snp.makeConstraints { (make) in
            make.left.equalTo(headPicture.snp.right).offset(10)
            make.top.equalTo(headPicture).offset(20)
        }
        
    }
    
    private func creatCell()  {
        accountCell = CommonCell()
        accountCell.titleImage = R.image.icon_life()
        accountCell.title = "账户"
        view.addSubview(accountCell)
        accountCell.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(5)
            make.height.equalTo(50)
        }
        
        buyCell = CommonCell()
        buyCell.title = "已购"
        buyCell.titleImage = R.image.icon_between()
        view.addSubview(buyCell)
        buyCell.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(accountCell.snp.bottom).offset(0)
            make.height.equalTo(50)
        }
        
        orderCell = CommonCell()
        orderCell.title = "商城订单"
        orderCell.titleImage = R.image.icon_live()
        view.addSubview(orderCell)
        orderCell.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(buyCell.snp.bottom).offset(0)
            make.height.equalTo(50)
        }
        
        mygroupCell = CommonCell()
        mygroupCell.title = "我的拼团"
        mygroupCell.titleImage = R.image.icon_document()
        view.addSubview(mygroupCell)
        mygroupCell.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(orderCell.snp.bottom).offset(0)
            make.height.equalTo(50)
        }
    }
    
    

}
