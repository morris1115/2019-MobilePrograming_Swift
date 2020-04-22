import UIKit
class AddVC: UIViewController {
    //@IBOutlet var txtFieldMemo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnAddFord(_ sender: UIButton) {
        items.append("Ford")
        itemsImageFile.append("ford.jpg")
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAddBenz(_ sender: UIButton) {
        items.append("Mercedes-Benz")
        itemsImageFile.append("Benz.jpg")
        itemsInfo.append("★★★★★★★★★★\n기업명 : Mercedes-Benz\n\n국가 : 독일\n\n창립 년도: 1883\n\n창시자 : 칼 벤츠, 고틀립 다임러\n\n브랜드 가치 : $580억(한화 :69조)\n\n브랜드 순위 : 1위\n\n대표모델: E-class, C-class, S-class ..etc\n★★★★★★★★★★")
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAddbmw(_ sender: UIButton) {
        items.append("BMW")
        itemsImageFile.append("bmw.jpg")
        itemsInfo.append("★★★★★★★★★★\n기업명 : BMW\n\n국가 : 독일\n\n창립 년도: 1916\n\n창시자 : 프란츠 요세프 포프\n\n브랜드 가치 : $490억(한화 :58조)\n\n브랜드 순위 : 3위\n\n대표모델: 3series, 5series, 7series ..etc\n★★★★★★★★★★")
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAddAudi(_ sender: UIButton) {
        items.append("Audi")
        itemsImageFile.append("audi.jpg")
        itemsInfo.append("★★★★★★★★★★\n기업명 : Audi\n\n국가 : 독일\n\n창립 년도: 1909\n\n창시자 : 아우구스트 호르히\n\n브랜드 가치 : $200억(한화 :23조)\n\n브랜드 순위 : 9위\n\n대표모델: A4, A6, A8 ..etc\n★★★★★★★★★★")
        _ = navigationController?.popViewController(animated: true)
    }
}
