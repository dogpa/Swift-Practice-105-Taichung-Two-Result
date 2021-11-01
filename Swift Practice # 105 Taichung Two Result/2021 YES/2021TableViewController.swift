//
//  2021TableViewController.swift
//  Swift Practice # 105 Taichung Two Result
//
//  Created by Dogpa's MBAir M1 on 2021/11/1.
//

import UIKit

class _021TableViewController: UITableViewController {
    
    let voteResultFor2021Array = VoteResult2021CSV.data
    var agree = 0
    var disAgree = 0
    var totalPollingStation = 0
    var agreeArray = [AgreeResult]()
    var disAgreeArray = [DisAgreeResult]()
    

    
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
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        checkAgreeAndDisAgree()
        
        
        //print("yes\(agreeArray.count) no\(disAgreeArray.count)")
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return agreeArray.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TC2021TableViewCell", for: indexPath) as? TC2021TableViewCell else{return UITableViewCell()}

        
        cell.villageLabel.text = agreeArray[indexPath.row].district + agreeArray[indexPath.row].village
        cell.agreeLabel.textColor = .blue
        cell.agreeLabel.text = "同意 \(agreeArray[indexPath.row].agree) 票"
        cell.disAgreeLabel.textColor = .red
        cell.disAgreeLabel.text = "不同意 \((agreeArray[indexPath.row].disagree)) 票"
        cell.percentageLabel.textColor = .green
        cell.percentageLabel.text = "同意票 \(String(format: "%.3f", ((agreeArray[indexPath.row].agreePercentage) * 100))) %"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        return "同意＞不同意投票所：\(agreeArray.count) 間"
    }
}
