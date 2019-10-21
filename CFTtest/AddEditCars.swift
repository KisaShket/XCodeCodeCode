//
//  AddEditCars.swift
//  CFTtest
//
//  Created by Miska  on 20/10/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation
import RealmSwift

class AddEditCars:UITableViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBOutlet weak var carsManufacturerTxt: UITextField!
    @IBOutlet weak var carsModelTxt: UITextField!
    @IBOutlet weak var carsHorsePowerTxt: UITextField!
    @IBOutlet weak var engineTypePicker: UIPickerView!
    @IBOutlet weak var bodyTypePicker: UIPickerView!
    @IBOutlet weak var issueDateTxt: UITextField!
    
    
    let datePicker = UIDatePicker()
    let engineType = EngineAndBodyTypes().engineTypes
    let bodyType = EngineAndBodyTypes().bodyTypes
    var engineTypeToEdit:String = ""
    var bodyTypeToEdit:String = ""
    var bodyTypeRowToEdit:Int? = nil
    var engineRowToEdit:Int? = nil
    var carToEdit = CarsModel()
    var manufacturerToEdit:String = ""
    var modelToEdit:String = ""
    var horsePowerToEdit:String = ""
    var issueDateToEdit:String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == bodyTypePicker{
            return bodyType.count
        }else {
            return engineType.count
        }
    
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
                if pickerView == bodyTypePicker{
                    bodyTypeToEdit = bodyType[row]
                    bodyTypeRowToEdit = row
                    return bodyType[row]
                }else {
                    engineTypeToEdit = engineType[row]
                    engineRowToEdit = row
                    return engineType[row]
                }
            }
    
    
    func savingCars(){
        let newCar = CarsModel()
        newCar.manufacturer = carsManufacturerTxt.text!
        newCar.model = carsModelTxt.text!
        newCar.horsePower = carsHorsePowerTxt.text!
        newCar.engineTypeRow = engineRowToEdit!
        newCar.bodyTypeRow = bodyTypeRowToEdit!
        newCar.bodyType = bodyTypeToEdit
        newCar.engineType = engineTypeToEdit
        newCar.issueDate = issueDateToEdit
        newCar.id = carToEdit.id
        CarsController.saveEditCars(Cars: newCar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        issueDateTxt.inputView = datePicker
        datePicker.datePickerMode = .date
        
        datePicker.addTarget(self, action:#selector(AddEditCars.dateChanged(datePicker:)), for: .valueChanged)
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpc = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpc, doneButton], animated: true)
        issueDateTxt.inputAccessoryView = toolBar
        
    }
    
    @objc func doneAction(){
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        issueDateTxt.text = dateFormatter.string(from: datePicker.date)
        issueDateToEdit = dateFormatter.string(from: datePicker.date)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        carsManufacturerTxt.text = manufacturerToEdit
        carsModelTxt.text = modelToEdit
        carsHorsePowerTxt.text = horsePowerToEdit
        bodyTypePicker.selectRow(carToEdit.bodyTypeRow, inComponent: 0, animated: true)
        engineTypePicker.selectRow(carToEdit.engineTypeRow, inComponent: 0, animated: true)
        issueDateTxt.text = issueDateToEdit
    }
    
      @IBAction func saveCar(_ sender: Any) {
        savingCars()
        self.navigationController?.popToRootViewController(animated: true)
    }

}
