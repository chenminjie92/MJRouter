//
//  LoginViewController.swift
//  LoginModule-LoginModule
//
//  Created by chenminjie on 2021/3/11.
//

import Foundation
import SnapKit

class GoodsDetailViewController: UIViewController {
    
    convenience init(_ goodsId: String) {
        self.init()
        self.goodsId = goodsId
    }
    
    var goodsId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    lazy var goodsIdLabel: UILabel = {
        let view = UILabel()
        return view
    }()
}

extension GoodsDetailViewController {
    
    private func setUpViews() {
        navigationItem.title = "商品详情"
        view.backgroundColor = UIColor.white
        view.addSubview(goodsIdLabel)
        goodsIdLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        goodsIdLabel.text = goodsId
    }
}
