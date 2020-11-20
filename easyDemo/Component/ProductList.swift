//
//  ProductList.swift
//  easyDemo
//
//  Created by admin on 2020/11/2.
//

import Foundation
import UIKit
import Kingfisher

protocol ProductListDelegate {
    func didSelectProduct(product: Product)
}

//自定义cell，初始化cell
class ProductCell: UITableViewCell {
    
    //定义属性
    let priceLabel: UILabel
    let productImageView: UIImageView
    
    //初始化数据
    var item:Product? {
        //didSet 属性改变之后我们要做的事
        didSet {
            if let p = self.item {
                self.productImageView.kf.setImage(with: URL(string: p.imageUrl))
                self.textLabel?.text = p.name
                self.detailTextLabel?.text = p.desc
                self.priceLabel.text = "￥\(p.price)"
            }
        }
    }
    
    //初始化cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        priceLabel = UILabel(frame: .zero)
        productImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
        
    }
    
    //创建UI
    private func setupViews() {
        textLabel?.textColor = UIColor.hexColor(0x333333)
        detailTextLabel?.textColor = UIColor.hexColor(0x999999)
        detailTextLabel?.numberOfLines = 2
        priceLabel.textColor = UIColor.hexColor(0xe23b41)
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
        
        contentView.addSubview(priceLabel)
        contentView.addSubview(productImageView)
        
        productImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        
        textLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(productImageView.snp_rightMargin).offset(12)
            make.top.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
        
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(textLabel!)
            make.centerY.equalTo(contentView)
        }
        
        detailTextLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(textLabel!)
            make.bottom.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//定义我们首页的列表
class ProductList: UIView, UITableViewDelegate, UITableViewDataSource {
   
    var tableView: UITableView
    var items: [Product] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var delegate: ProductListDelegate?
    
    //初始化
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: frame)
        self.setupViews()
    }
    
    //创建tableview
    func setupViews()  {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //as? 将cell转换为自定义的productCell,如果转换失败则为nil，类似可选项
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as? ProductCell
        if cell == nil {
            cell = ProductCell(style: .subtitle, reuseIdentifier: "cellId")
        }
        cell?.item = items[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        delegate?.didSelectProduct(product: items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
