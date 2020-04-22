//
//  TableVC.swift
//  PHONE
//
//  Created by hallym-de1111 on 2019. 11. 27..
//  Copyright © 2019년 PJS. All rights reserved.
//

import UIKit


var items = ["Hyundai","KIA","CHEVROLET"]
var itemsImageFile = ["hyundai.jpg","Kia.jpg","CHEVROLET.jpg"]
var itemsInfo = ["★★★★★★★★★★\n기업명 : 현대자동차\n\n국가 : 대한민국\n\n창립 년도: 1967년 12월 29일\n\n창시자 : 정주영\n\n브랜드 가치 : $141억(한화 :16조)\n\n브랜드 순위 : 13위\n\n대표모델: Avante, Sonata, Grandure ..etc\n★★★★★★★★★★", "★★★★★★★★★★\n기업명 : 기아자동차\n\n국가 : 대한민국\n\n창립 년도: 1944년 12월 11일\n\n창시자: 김철호\n\n브랜드 가치 : $64.3억(한화 :7.6조)\n\n브랜드 순위 : 20위\n\n대표모델: K3, K7, K9, CARNIVAL ..etc\n★★★★★★★★★★", "★★★★★★★★★★\n기업명 : CHEVROLET(쉐보레)\n\n국가 : 미국\n\n창립 년도: 1911\n\n창시자 : 루이 쉐보레(Louis Chevrolet)\n\n브랜드 가치 : $300억(한화 :35.7조)\n\n브랜드 순위 : 10위\n\n대표모델: Malibu, Spark, Orlando ..etc\n★★★★★★★★★★"]

class TableVC: UITableViewController {
    @IBOutlet var tableViewMemo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
         // 왼쪽 위 상단에 edit버트을 만들어 스크롤 말고 터치로 삭제 한는 기능 추가
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewMemo.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //  테이블 안에 섹션이 한 개 이므로 return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count // 섹션당 열의 개수는 items의 개수 이므로 items의 개수만큼 return
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[indexPath.row])
        return cell // 테이블 목록 출력
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    } // 삭제하하는 부분
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?{
        return "삭제"
    } // Delete를 한글로 변경
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sgDetail" {
            
            let cell = sender as! UITableViewCell
            let indexPath = self.tableViewMemo.indexPath(for: cell)
            let detailView = segue.destination as! DetailVC
            detailView.receive(items[((indexPath as NSIndexPath?)?.row)!])
            detailView.receive2(itemsInfo[((indexPath as NSIndexPath?)?.row)!])
       }
    }


}
