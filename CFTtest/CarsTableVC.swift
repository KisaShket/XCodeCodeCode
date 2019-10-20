//
//  CarsTableVC.swift
//  CFTtest
//
//  Created by Miska  on 19/10/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation
import RealmSwift

class CarsTableVC:UITableViewController{
    var dataSrc: Results<CarsModel>!
    
    //MARK: обновление вью, получение данных
    func reloadTable(){
        dataSrc = CarsController.fetchCars()
        tableView?.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadTable()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTable()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSrc.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carsCell", for: indexPath)
        let cars = dataSrc[indexPath.row]
        cell.textLabel?.text = cars.manufacturer + " " + cars.model
        cell.detailTextLabel?.text = cars.horsePower + " л.с."
        return cell
    }
    
    @IBAction func toAddSegue(_ sender: Any) {
        performSegue(withIdentifier: "showCars", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCars"{
            var indOfCars = tableView.indexPathForSelectedRow
            let Cars = dataSrc[(indOfCars?.row)!]
            let EditCars = segue.destination as! AddEditCars
            EditCars.carToEdit = Cars
            EditCars.manufacturerToEdit = Cars.manufacturer
            EditCars.modelToEdit = Cars.model
            EditCars.horsePowerToEdit = Cars.horsePower
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editCars", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deletingCars = dataSrc[indexPath.row]
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") {
            _, indexPath in
            CarsController.deleteCars(CarsToDelete:deletingCars)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    
}
