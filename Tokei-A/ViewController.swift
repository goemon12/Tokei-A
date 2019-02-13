//アナログ時計のサンプルApp
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var imgM: UIImageView!
    @IBOutlet weak var imgS: UIImageView!
    var fmtH: DateFormatter!
    var fmtM: DateFormatter!
    var fmtS: DateFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1 ... 12 {
            let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            lbl.text = "\(i)"
            lbl.font = UIFont(name: "Helvetica", size: 30)
            lbl.textAlignment = .center
            lbl.center = CGPoint(
                x: self.view.center.x + sin(CGFloat.pi * 2 / 12 * CGFloat(i)) * 150,
                y: self.view.center.y - cos(CGFloat.pi * 2 / 12 * CGFloat(i)) * 150)
            self.view.addSubview(lbl)
        }
        
        fmtH = DateFormatter()
        fmtM = DateFormatter()
        fmtS = DateFormatter()
        fmtH.dateFormat = "HH"
        fmtM.dateFormat = "mm"
        fmtS.dateFormat = "ss"
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        let date = Date()
        let intH = Int(fmtH.string(from: date))
        let intM = Int(fmtM.string(from: date))
        let intS = Int(fmtS.string(from: date))

        let FltH = CGFloat(intH!) + CGFloat(intM!) / 60
        let FltM = CGFloat(intM!) + CGFloat(intS!) / 60
        let FltS = CGFloat(intS!)
        
        imgH.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0 / 12.0 * FltH)
        imgM.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0 / 60.0 * FltM)
        imgS.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0 / 60.0 * FltS)
    }
}

