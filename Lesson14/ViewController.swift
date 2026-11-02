
import UIKit

class ViewController: UIViewController {
    
    @IBAction func secondButtonPressed(_ sender: UIButton) {
        blurEffect.isHidden = false
        let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            self.blurEffect.isHidden = true })
                                         
    }
    @IBOutlet weak var blurr: UIView!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.topLabelConstraint.constant += 35
        //blurEffect.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //self.blurEffect.isHidden = true
        }

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
    }
    
    @IBAction func thirdPressed(_ sender: UIButton) {
        showAlert()
    }
    
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var labelLabel: UILabel!
    @IBOutlet weak var topLabelConstraint: NSLayoutConstraint!
    
    private func showAlert() {
        let alert = UIAlertController(title: "Hello", message: "Alert was shown", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in print("Launched")}
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let destructiveAction = UIAlertAction(title: "Kill em all", style: .destructive) { _ in
            self.blurEffect.isHidden = false
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in self.blurEffect.isHidden = true
            })
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        present(alert, animated: true)
    }
}

