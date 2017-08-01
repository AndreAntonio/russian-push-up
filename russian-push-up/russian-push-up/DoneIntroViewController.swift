//
//  DoneIntroViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 28/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit

class DoneIntroViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var maxPickerView: UIPickerView!
    
    // O vetor tem esse nome pq ele tem numeros, mas ele é um vetor de Strings. O método do delegate do Picker View retorna apenas Strings, por isso fiz isso. De qualquer forma, a variavel que pega o valor do picker é a "selected".
    var numbers = [String]()
    
    //This variable is currently storing the value from the picker view. We gotta see how to store this value and work with it. 
    //Alem disso, ela é uma String. Na linha 84 eu crio uma variavel nova fazendo um cast dessa.
    var selected : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating pickerview
        maxPickerView = UIPickerView()
        maxPickerView.frame = CGRect(x: 0, y: 250, width: self.view.bounds.width, height: 200)
        maxPickerView.showsSelectionIndicator = true
        self.view.addSubview(maxPickerView)
        maxPickerView.delegate = self
        maxPickerView.dataSource = self
        
        for i in 1...100 {
            numbers.append("\(i)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //total number of components - vertical
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //total number of rows - horizontal
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    //func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //  return numbers[row]
    //}
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    //called when did select some row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //  label.text = numbers[row]
        self.selected = numbers[row]
        print(selected)
    }
    
    
    
    // Esse metodo aqui é o infeliz que só retorna String.
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let strTitle = numbers[row]
        let attString = NSAttributedString(string: strTitle, attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attString
    }
    
    //func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    //  let backview = UIView()
    // backview.backgroundColor = .white
    // return backview
    
    //}
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        //variavel nova sendo feito um cast da variavel global.
        var selectedNumber = maxPickerView.selectedRow(inComponent: 0) + 1
        Vladmir.sharedInstance.setMax(to: selectedNumber)
        print(selectedNumber)
        
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKey: "skipIntroPages")
        defaults.synchronize()
        
        let nextView : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = nextView
        
        
        
    }
}
