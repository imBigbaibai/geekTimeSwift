//
//  LoginViewController.swift
//  easyDemo
//
//  Created by admin on 2020/10/28.
//

import UIKit
import SnapKit

protocol ValidataPhoneNum {
    func validadaPhone(_ phoneNumber: String) -> Bool
}

protocol ValidataPassword {
    func validadaPassword(_ password: String) -> Bool
}

extension ValidataPhoneNum {
    func validadaPhone(_ phoneNumber: String) -> Bool {
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValidataPassword {
    func validadaPassword(_ password: String) -> Bool {
        if password.count < 6 || password.count > 12 {
            return false
        }
        return true
    }

}

class LoginViewController: BaseViewController, ValidataPhoneNum, ValidataPassword {

    var phoneTextField: UITextField!
    var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = UIImageView(image: R.image.logoJpg())
        view.addSubview(loginView)
        loginView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
        }
        
        let phoneIconView = UIImageView(image: R.image.手机())
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.placeholder = "请输入手机号"
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(loginView.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
        
        
        let passwordIconView = UIImageView(image: R.image.密码())
        passwordTextField = UITextField()
        passwordTextField.leftView = passwordIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextField.snp_bottomMargin).offset(15)
            make.height.equalTo(50)
        }
        
        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        loginButton.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
        
        loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)

    }
    
    @objc func didClickLoginButton()  {
        if validadaPhone(phoneTextField.text ?? "") && validadaPassword(passwordTextField.text ?? ""){
            
        }else {
            self.showToast()
        }
    }
    
    func showToast() {
        let alert = UIAlertController(title: "提示", message: "用户名或密码错误", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true, completion: nil)
        }
    }

   
}
