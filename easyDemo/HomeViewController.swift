//
//  HomeViewController.swift
//  easyDemo
//
//  Created by admin on 2020/10/30.
//

import UIKit

class HomeViewController: BaseViewController, ProductListDelegate {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        
        let productList = ProductList(frame: .zero)
        productList.items = FakeData.creatProducts()
        productList.delegate = self
        view.addSubview(productList)
        productList.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(181)
        }
        
    }
    
    func didSelectProduct(product: Product) {
        let detailVC = DetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.product = product
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    

}
