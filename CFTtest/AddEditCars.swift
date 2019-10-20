//
//  AddEditCars.swift
//  CFTtest
//
//  Created by Miska  on 20/10/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation
import RealmSwift

class AddEditCars: UITableViewController{
    
    @IBOutlet weak var carsManufacturerTxt: UITextField!
    @IBOutlet weak var carsModelTxt: UITextField!
    @IBOutlet weak var carsHorsePowerTxt: UITextField!
    
    var carToEdit = CarsModel()
    var manufacturerToEdit:String = ""
    var modelToEdit:String = ""
    var horsePowerToEdit:String = ""
    
    func savingCars(){
        let newCar = CarsModel()
        newCar.manufacturer = carsManufacturerTxt.text!
        newCar.model = carsModelTxt.text!
        newCar.horsePower = carsHorsePowerTxt.text!
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
    }
    
    @IBAction func saveCar(_ sender: Any) {
        savingCars()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}

