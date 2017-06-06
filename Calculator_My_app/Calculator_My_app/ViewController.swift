
import UIKit

class ViewController: UIViewController {
  
  var previousNumber: Double = 0
  var numberOnScreen: Double = 0
  var performingMath = false
  var operation = 0
  
  @IBOutlet weak var label: UILabel!
  
  @IBAction func button(_ sender: UIButton) {
    
    if(performingMath == true){
      
      
      if(sender.currentTitle == "π"){
        label.text = String(Double.pi)
        numberOnScreen = Double.pi
      }
      else {
        label.text = sender.currentTitle
        numberOnScreen = Double(label.text!)!
      }
        performingMath = false
      
    }
    else {
      label.text = label.text! + sender.currentTitle!
      numberOnScreen = Double(label.text!)!
    }
    
  }
  
  @IBAction func operands(_ sender: UIButton) {
    //label.text = ""
    
    if (label.text != "" && sender.currentTitle != "=" && sender.currentTitle != "C"  ) {
      previousNumber = Double(label.text!)!
      
      if(sender.currentTitle == "+") {
        label.text = "+"
        operation = 1
      }
      else if(sender.currentTitle == "-") {
        label.text = "-"
        operation = 2
      }
      else if(sender.currentTitle == "*") {
        label.text = "*"
        operation = 3
      }
      else if(sender.currentTitle == "/") {
        label.text = "/"
        operation = 4
      }
      else if(sender.currentTitle == "√") {
        label.text = String(sqrt(previousNumber))
      }
      else  if(sender.currentTitle == "cos") {
        label.text = String(cos(numberOnScreen))
      }
      else if(sender.currentTitle == "sin") {
        label.text = String(sin(numberOnScreen))
      }
      performingMath = true
    }
    else if(sender.currentTitle == "=") {
      
      if (operation == 1) {
        label.text = String(previousNumber + numberOnScreen)
      }
      else if (operation == 2) {
        label.text = String(previousNumber - numberOnScreen)
      }
      else if (operation == 3) {
        label.text = String(previousNumber * numberOnScreen)
      }
      else if (operation == 4) {
        label.text = String(previousNumber / numberOnScreen)
      }
    }
    else if(sender.currentTitle == "C") {
      label.text = ""
      previousNumber = 0
      numberOnScreen = 0
      operation = 0
    }
  }
}
