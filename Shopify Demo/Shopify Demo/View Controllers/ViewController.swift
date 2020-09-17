

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        UIView.animate(withDuration: 3.0, delay: 2.0, options: .curveEaseIn, animations: {
            self.img.frame = CGRect(x: self.img.frame.origin.x, y: self.img.frame.origin.y, width: 214, height: 250) //2

        }, completion: { finished in
            let s = UIStoryboard.init(name: "Main", bundle: nil)
                     if #available(iOS 13.0, *) {
                         let obj = s.instantiateViewController(identifier: "CollectionsViewController") as! CollectionsViewController
                         self.navigationController?.pushViewController(obj, animated: false)

                     } else {
                         // Fallback on earlier versions
                     }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
