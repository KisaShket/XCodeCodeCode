//
//  AddEditCars.swift
//  CFTtest
//
//  Created by Miska  on 20/10/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation
import RealmSwift

class AddEditCars:UITableViewController{
    

    @IBOutlet weak var carsManufacturerTxt: UITextField!
    @IBOutlet weak var carsModelTxt: UITextField!
    @IBOutlet weak var carsHorsePowerTxt: UITextField!
    @IBOutlet weak var engineTypeTxt: UITextField!
    @IBOutlet weak var bodyTypeTxt: UITextField!
    @IBOutlet weak var issueDateTxt: UITextField!
   
    var carToEdit = CarsModel()
    var manufacturerToEdit:String = ""
    var modelToEdit:String = ""
    var horsePowerToEdit:String = ""
    var bodyTypeToEdit:String = ""
    var engineTypeToEdit:String = ""
    var dateToEdit:String = ""
    var issueDateToEdit:String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    
    
    func savingCars(){
        let newCar = CarsModel()
        newCar.manufacturer = carsManufacturerTxt.text!
        newCar.model = carsModelTxt.text!
        newCar.horsePower = carsHorsePowerTxt.text!
        newCar.bodyType = bodyTypeTxt.text!
        newCar.engineType = engineTypeTxt.text!
        newCar.issueDate = issueDateTxt.text!
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
        engineTypeTxt.text = engineTypeToEdit
        bodyTypeTxt.text = bodyTypeToEdit
        issueDateTxt.text = issueDateToEdit
    }
    
      @IBAction func saveCar(_ sender: Any) {
        savingCars()
        self.navigationController?.popToRootViewController(animated: true)
    }

}
