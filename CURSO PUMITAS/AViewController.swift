//
//  AViewController.swift
//  CURSO PUMITAS
//
//  Created by Fernando Vargas Salas on 12/2/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//
import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

class AViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var Atras: UIButton!
    @IBOutlet weak var Total: UILabel!
    
    
    var ref: DocumentReference!
    var getRef: Firestore!
    var imagenes : Storage!
    
    
    var datosFB: [String] = []
    var grupoFB: [String] = []
    var tiempo: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CeldaTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "BA")
        table.delegate = self
        table.dataSource = self
        getRef = Firestore.firestore()
        imagenes = Storage.storage()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        getAlumnos()
        setupElements()
        getCount()
        
        
    }
    
    
    func setupElements(){
        //Error.alpha = 0
        
        Utilidades.styleFilledButton(Atras)
        
    }
    

    
    func getAlumnos(){
        
        getRef.collection("Pumitas").whereField("Grupo", isEqualTo: "A").order(by: "Tiempo").addSnapshotListener{ (querySnapshot, error) in
            
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            self.datosFB.removeAll()
            self.grupoFB.removeAll()
            self.tiempo.removeAll()
            
            
            
            for document in querySnapshot!.documents{
                let id = document.documentID
                
                let values = document.data()
                let nombre = values["Niño"] as? String ?? "No tiene info"
                let grupo = values["Grupo"] as? String ??  "No tiene info"
                let hora = values["Hora"] as? String ?? "No tine info"
                //let pumita = values["foto"] as? UIImage?? "No hay foto"
                
                self.datosFB.append(nombre)
                self.grupoFB.append(grupo)
                self.tiempo.append(hora)
                
                
            }
            self.table.reloadData()
        }
        
    }
    
    func getCount() {
        getRef.collection("Pumitas").whereField("Grupo", isEqualTo: "A").getDocuments() { (querySnapshot, err) in
            var totalCount = 0
            if err != nil {
                // Error getting shards
                // ...
            } else {
                for document in querySnapshot!.documents {
                    let count = document.data()["Count"] as! Int
                    totalCount += count
                }
            }
            
            print("Total count is \(totalCount)")
            self.Total.text = "PUMITAS EN REGISTRO:  \(String(totalCount))"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosFB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "BA", for: indexPath) as! CeldaTableViewCell
        Cell.titulo!.text = "PUMITA:\(datosFB[indexPath.row])"
        Cell.Grupo!.text = "GRUPO:\(grupoFB[indexPath.row])"
        Cell.hora!.text = "\(tiempo[indexPath.row]) "
        
        if indexPath.row % 2 == 0 {
            Cell.backgroundColor = .white
        }else{
            Cell.backgroundColor = .lightGray
            
        }
        return Cell
    }
    
    
    
    
    @IBAction func REGRESAR(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
