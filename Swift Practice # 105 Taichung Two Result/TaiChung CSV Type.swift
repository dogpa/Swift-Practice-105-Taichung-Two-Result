//
//  TaiChung CSV Type.swift
//  Swift Practice # 105 Taichung Two Result
//
//  Created by Dogpa's MBAir M1 on 2021/11/1.
//

import UIKit
import Foundation
import CodableCSV

//CSV解析
struct VoteResult2021CSV:Codable {
    let district: String?               //投票所行政區
    let village: String?                //投票所裡別
    let pollingStation: String?         //投票所編號
    let agree: Int                    //同意罷免票
    let disagree:Int                    //不同意罷免票
    let vaildCount:Int                 //同意票加不同意票總數
    
}
//取得CSV檔案內容
extension VoteResult2021CSV {
    static var data: [Self] {
        var array = [Self]()
        if let data = NSDataAsset(name: "2021INTTaiChungPollingStation")?.data {
            let decoder = CSVDecoder {
                $0.headerStrategy = .firstLine
            }
            do {
                array = try decoder.decode([Self].self, from: data)
            } catch {
                print(error)
            }
        }
        return array
    }
}

//存放同意的資料
struct AgreeResult:Codable {
    let district: String
    let village: String
    let agree: Int
    let disagree: Int
    let agreePercentage:Float
}

//存放不同意的資料
struct DisAgreeResult:Codable {
    let district: String
    let village: String
    let agree: Int
    let disagree: Int
    let disAgreePercentage:Float
}



