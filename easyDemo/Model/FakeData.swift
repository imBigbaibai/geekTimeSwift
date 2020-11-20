//
//  FakeData.swift
//  easyDemo
//
//  Created by admin on 2020/10/27.
//
//  列表页，产品列表，已购列表等
import Foundation

class FakeData {
    // static 静态方法，无需实例化类，直接调用
    
    private static var bannerList = [String]() //banner信息
    private static var products = [Product]()
    private static var deals = [Deal]()
    
    
    //banner
    static func creatBanner() -> [String] {
        if bannerList.count == 0 {
            bannerList = [
                "https://hbimg.huabanimg.com/b62ca7bc0ac8f15d2a2252be8f0c036e6e2b76504f167d-myQgYv_fw658/format/webp",
                
                "https://hbimg.huabanimg.com/9e92828e94fd722470d0c17eb34c32a9c90ab6926fda60-mv2DR3_fw658/format/webp",
                
                "https://hbimg.huabanimg.com/03f531347e4b90b94282383dc0e73b0b782270838b7c91-KH4qDb_fw658/format/webp"
            ]
        }
        return bannerList
    }
    
    //product
    static func creatProducts() -> [Product] {
        if products.count == 0 {
            let p1 = Product(imageUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603860618270&di=9052b99e839bf0d5c4943311a3565e20&imgtype=0&src=http%3A%2F%2Fassets.jikexueyuan.com%2Fuser%2Favatar%2Fd8%2Fa6%2F6256645.jpg", name: "陈小春", price: 10, desc: "好课程上极客", teacher: "老牛", total: 100, update: "15", student: 20, detail: "Tapdata CTO, MongoDB中文社区主席，前MongoDB大中华区首席架构师", courseList: "从零开始（3讲）")
            let p2 = Product(imageUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603860618270&di=9052b99e839bf0d5c4943311a3565e20&imgtype=0&src=http%3A%2F%2Fassets.jikexueyuan.com%2Fuser%2Favatar%2Fd8%2Fa6%2F6256645.jpg", name: "老师", price: 10, desc: "好课程上极客", teacher: "老牛", total: 100, update: "15", student: 20, detail: "这一块是描述的东西", courseList: "从零开始（3讲）")
            let p3 = Product(imageUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603860618270&di=9052b99e839bf0d5c4943311a3565e20&imgtype=0&src=http%3A%2F%2Fassets.jikexueyuan.com%2Fuser%2Favatar%2Fd8%2Fa6%2F6256645.jpg", name: "老师", price: 10, desc: "好课程上极客", teacher: "老牛", total: 100, update: "15", student: 20, detail: "这一块是描述的东西", courseList: "从零开始（3讲）")
            let p4 = Product(imageUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603860618270&di=9052b99e839bf0d5c4943311a3565e20&imgtype=0&src=http%3A%2F%2Fassets.jikexueyuan.com%2Fuser%2Favatar%2Fd8%2Fa6%2F6256645.jpg", name: "老师", price: 10, desc: "好课程上极客", teacher: "老牛", total: 100, update: "15", student: 20, detail: "这一块是描述的东西", courseList: "从零开始（3讲）")
            
            products = [p1, p2, p3, p4]
            
        }
        return products
    }
    
    
    static func creatDeals() -> [Deal] {
        if deals.count == 0 {
            deals = FakeData.creatProducts().map {
                Deal(product: $0, progress: 1)
            }
        }
        return deals
    }
}

