//
//  LectureTableViewCell.swift
//  Hearld_iOS_v2
//
//  Created by 乔哲锋 on 19/02/2018.
//  Copyright © 2018 乔哲锋. All rights reserved.
//

import Foundation
import UIKit
import SwiftDate

class LectureTableViewCell: UITableViewCell {
    
    var lecture: LectureModel? { didSet { updateUI() } }
    
    var timeLabel = UILabel()
    var locationLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
 
    private func customInit() {
        self.selectionStyle = .none
        layoutUI()
    }
    
    private func layoutUI() {
        // 时间
        timeLabel.into(contentView).top(10).left(15).width(150).height(30).bottom(10)
            .font(18,.semibold).color(HeraldColorHelper.NormalTextColor.Primary)
        
        // 地点
        locationLabel.into(contentView).top(10).right(15).width(150).height(30).bottom(10)
            .font(16,.semibold).color(HeraldColorHelper.GeneralColor.Regular).align(NSTextAlignment.right)
    }
    
    private func updateUI() {
        let date = TimeConvertHelper.convert(from: (lecture?.time)!)
        let displayTime = TimeConvertHelper.convert(from: date)
        timeLabel.text = displayTime
        locationLabel.text = lecture?.location
    }
}

