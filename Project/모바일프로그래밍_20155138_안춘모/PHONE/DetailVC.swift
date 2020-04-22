import UIKit
class DetailVC: UIViewController {
    
    var receiveItem = ""
    var a = "가나다라마바사"
    @IBOutlet var lbl: UILabel!
    @IBOutlet var txtView: UITextView!
    
    override func viewDidLoad() {
        
        lbl.text = receiveItem
        txtView.text = a
    }
    
    func receive(_ item: String) {
        receiveItem = item
    }
    func receive2(_ item2 : String) {
        a = item2
    }
}
