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
    @IBOutlet weak var datePicker: UIDatePicker!
    
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
        newCar.id = carToEdit.id
        CarsController.saveEditCars(Cars: newCar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        carsManufacturerTxt.text = manufacturerToEdit
        carsModelTxt.text = modelToEdit
        carsHorsePowerTxt.text = horsePowerToEdit
        
       
        bodyTypePicker.selectRow(carToEdit.bodyTypeRow, inComponent: 0, animated: true)
        engineTypePicker.selectRow(carToEdit.engineTypeRow, inComponent: 0, animated: true)
        
    }
    
      @IBAction func saveCar(_ sender: Any) {
        savingCars()
        print(engineRowToEdit!,bodyTypeRowToEdit!,engineTypeToEdit,bodyTypeToEdit)
        self.navigationController?.popToRootViewController(animated: true)
    }

}
