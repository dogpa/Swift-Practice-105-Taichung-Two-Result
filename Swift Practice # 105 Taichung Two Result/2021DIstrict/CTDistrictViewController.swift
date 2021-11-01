//
//  CTDistrictViewController.swift
//  Swift Practice # 105 Taichung Two Result
//
//  Created by Dogpa's MBAir M1 on 2021/11/1.
//

import UIKit

class CTDistrictViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    let voteResultFor2021Array = VoteResult2021CSV.data
    var agree = 0
    var disAgree = 0
    var totalPollingStation = 0
    var agreeArray = [AgreeResult]()
    var disAgreeArray = [DisAgreeResult]()
    
    var districtNameArray = ["沙鹿區","龍井區","大肚區","烏日區","霧峰區"]
    var distAgreeCountArray = [0,0,0,0,0]
    var distDisagreeCountArray = [0,0,0,0,0]

    var resultTextForDist = ""
    var resultTextForAgree = ""
    var resultTextForDisgree = ""
    
    func checkAgreeAndDisAgree () {
        
        for i in 0...voteResultFor2021Array.count - 1{
            if voteResultFor2021Array[i].village != nil {
                totalPollingStation += 1
                if voteResultFor2021Array[i].agree > voteResultFor2021Array[i].disagree {
                    agree += 1
                    agreeArray.append(AgreeResult(district:voteResultFor2021Array[i].district!,  village: voteResultFor2021Array[i].village!, agree: voteResultFor2021Array[i].agree, disagree: voteResultFor2021Array[i].disagree, agreePercentage: ((Float(voteResultFor2021Array[i].agree))/(Float)(voteResultFor2021Array[i].vaildCount))))
                }else if voteResultFor2021Array[i].disagree > voteResultFor2021Array[i].agree {
                    disAgree += 1
                    disAgreeArray.append(DisAgreeResult(district:voteResultFor2021Array[i].district!,village: voteResultFor2021Array[i].village!, agree: voteResultFor2021Array[i].agree, disagree: voteResultFor2021Array[i].disagree, disAgreePercentage: ((Float(voteResultFor2021Array[i].disagree))/(Float)(voteResultFor2021Array[i].vaildCount))))
                }
            }
        }
        
        for agree in 0...districtNameArray.count - 1 {
            for x in 0...agreeArray.count - 1{
                if districtNameArray[agree] == agreeArray[x].district {
                    distAgreeCountArray[agree] += 1
                }
            }
        }
        
        for disagree in 0...districtNameArray.count - 1 {
            for x in 0...disAgreeArray.count - 1{
                if districtNameArray[disagree] == disAgreeArray[x].district {
                    distDisagreeCountArray[disagree] += 1
                }
            }
        }
        
       print(agreeArray.count)
       print(disAgreeArray.count)
       print(distAgreeCountArray)
       print(distDisagreeCountArray)
        
        
        for y in 0...4 {
            resultTextForDist = resultTextForDist + "\(districtNameArray[y])： 同意\(distAgreeCountArray[y])間佔\(String(format: "%.2f", ((Float(distAgreeCountArray[y]))/(Float(distAgreeCountArray[y]+distDisagreeCountArray[y]))*100)))% ，不同意\(distDisagreeCountArray[y])間佔\(String(format: "%.2f", (Float(distDisagreeCountArray[y])/(Float(distAgreeCountArray[y]+distDisagreeCountArray[y]))*100)))%\n"
        }
        
        for a in 0...4 {
            resultTextForAgree = resultTextForAgree + "\(districtNameArray[a])：\(String(format: "%.2f", Float(distAgreeCountArray[a])/160*100)) %\n"
        }
        
        for b in 0...4 {
            resultTextForDisgree = resultTextForDisgree + "\(districtNameArray[b])：\(String(format: "%.2f", Float(distDisagreeCountArray[b])/98*100)) %\n"
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        checkAgreeAndDisAgree()
        
        
        resultLabel.text = "\(resultTextForDist)\n同意各區佔比：\n\(resultTextForAgree)\n不同意各區佔比：\n\(resultTextForDisgree)"
    }
    



}
