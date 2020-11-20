//
//  DetailViewController.swift
//  easyDemo
//
//  Created by admin on 2020/11/17.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {

    var product: Product!
    var avatarView: UIImageView! //头像
    var nameLabel: UILabel! //课程名称
    var descLable: UILabel! //描述
    var teacherLabel: UILabel! // 讲师名称
    var courseCountLabel: UILabel! //课程进度
    var studentCoutnLabel: UILabel! //学生数量
    
    var tab: Tab!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情"
        creatTop()
        creatMiddle()
        creatBottom()
        // Do any additional setup after loading the view.
    }
    private func creatTop() {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.hexColor(0x303949)
        self.view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(220)
        }
        
        //头像
        avatarView = UIImageView()
        avatarView.kf.setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605610951760&di=da0a6dc724cf1855a6b4455abeb7e300&imgtype=0&src=http%3A%2F%2Fpic.baike.soso.com%2Fp%2F20130708%2F20130708140302-684309448.jpg"))
        avatarView.layer.masksToBounds = true
        avatarView.layer.cornerRadius = 5
        bgView.addSubview(avatarView)
        avatarView.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
        }
        
        //课程名
        nameLabel = UILabel()
        nameLabel.text = "MongoDB高手课"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        bgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarView.snp_rightMargin).offset(15)
            make.top.equalTo(avatarView)
        }
        
        //描述
        descLable = UILabel()
        descLable.text = product.detail
        descLable.textColor = UIColor.hexColor(0xA4D3EE)
        descLable.font = UIFont.systemFont(ofSize: 14)
        descLable.numberOfLines = 0
        bgView.addSubview(descLable)
        descLable.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(15)
            make.left.equalTo(nameLabel)
            make.width.equalTo(240)
        }
        
        //讲师名称
        teacherLabel = UILabel()
        teacherLabel.text = "讲师：" + product.teacher
        teacherLabel.textColor = UIColor.hexColor(0xA4D3EE)
        teacherLabel.font = UIFont.systemFont(ofSize: 14)
        bgView.addSubview(teacherLabel)
        teacherLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.bottom.equalTo(avatarView)
        }
        
        //进度
        courseCountLabel = UILabel()
        courseCountLabel.text = product.courseList
        courseCountLabel.textColor = UIColor.hexColor(0xA4D3EE)
        courseCountLabel.font = UIFont.systemFont(ofSize: 14)
        bgView.addSubview(courseCountLabel)
        courseCountLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarView)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        //学生数量
        studentCoutnLabel = UILabel()
        studentCoutnLabel.text = "共" + String(product.student) + "人学习"
        studentCoutnLabel.textColor = UIColor.hexColor(0xA4D3EE)
        studentCoutnLabel.font = UIFont.systemFont(ofSize: 14)
        bgView.addSubview(studentCoutnLabel)
        studentCoutnLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    private func creatMiddle()  {
        tab = Tab(items: ["课程介绍", "课程目录"])
        tab.selectedColor = UIColor.hexColor(0x2EA08B)
        view.addSubview(tab)
        tab.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(220)
            make.height.equalTo(50)
        }
    }
    
    private func creatBottom()  {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("购买 ￥\(product.price)", for: .normal)
        button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        button.addTarget(self, action: #selector(didClickBuyBUtton), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(55)
        }
        
    }
    
    //购买按钮回调点击事件
    @objc func didClickBuyBUtton(){
        
    }

   

}
