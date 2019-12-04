//
//  TutorViewController.swift
//  CURSO PUMITAS
//
//  Created by Fernando Vargas Salas on 11/26/19.
//  Copyright © 2019 Fernando Vargas Salas. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

class TutorViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var Tutor: UITextField!
    @IBOutlet weak var Nombre: UITextField!
    @IBOutlet weak var Edad: UITextField!
    @IBOutlet weak var Grupo: UITextField!
  
    @IBOutlet weak var Hora: UITextField!
    @IBOutlet weak var Enviar: UIButton!
    
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var Atras: UIButton!
    
    @IBOutlet weak var table: UITableView!
    
    
    var ref: DocumentReference!
    var getRef: Firestore!
    var imagenes : Storage!
    //var ref: DocumentReference!
    
    var datosFB: [String] = []
    var grupoFB: [String] = []
    var tiempo: [String] = []
    var imagen: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CeldaTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        getRef = Firestore.firestore()
        imagenes = Storage.storage()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        getAlumnos()
        setupUI()
        setupElements()
        getCount()
        

    }
    
    
    func setupElements(){
        //Error.alpha = 0
        Utilidades.styleTextField(Nombre)
        Utilidades.styleTextField(Tutor)
        Utilidades.styleTextField(Grupo)
        Utilidades.styleTextField(Edad)
        Utilidades.styleTextField(Hora)
        Utilidades.styleFilledButton(Enviar)
        Utilidades.styleFilledButton(Atras)
        
        
    }
    
    @IBAction func EnviarClick(_ sender: Any) {
        
        guard let fotoselec = self.imagen else {
            print("Niño sin foto")
            return
        }
        guard let imagenData = fotoselec.jpegData(compressionQuality: 0.4) else { return
        }
        var datos: [String: Any] = ["Nombre": Tutor.text, "Niño": Nombre.text, "Edad": Edad.text, "Grupo":Grupo.text,"Tiempo": Timestamp(date: Date()), "Count":1,"Hora": Hora.text ]
       // imagenes.reference(forURL: "gs://curso-pumitas.appspot.com")
        let niño_imagen = imagenes.reference(forURL: "gs://curso-pumitas.appspot.com").child("perfil").child("Niño" as! String)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        niño_imagen.putData(imagenData, metadata: metaData, completion:{(storageMetadata, error) in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            niño_imagen.downloadURL(completion: {(url, error)in
                if let metaImageURL = url?.absoluteString
                { datos["foto"] = metaImageURL
                    
                    self.getRef.collection("Pumitas").addDocument(data: datos as! [String : Any], completion: { (error) in
                        if let error = error{
                            print(error.localizedDescription)
                            return
                        }else{
                            print("Se guardaron los datos")
                        }
                    })
                    
                    
                }
        })
            
        })
        
        
    }
    
    
    func setupUI(){
        setupfoto()
        
    }
    
    func getAlumnos(){
      
        getRef.collection("Pumitas").order(by: "Grupo").order(by: "Niño").addSnapshotListener{ (querySnapshot, error) in
            
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
        getRef.collection("Pumitas").getDocuments() { (querySnapshot, err) in
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
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosFB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CeldaTableViewCell
        Cell.titulo!.text = "PUMITA:\(datosFB[indexPath.row])"
        Cell.Grupo!.text = "GRUPO:\(grupoFB[indexPath.row])"
        Cell.hora!.text = "\(tiempo[indexPath.row]) AM"
        
        if indexPath.row % 2 == 0 {
            Cell.backgroundColor = .white
        }else{
            Cell.backgroundColor = .lightGray
            
        }
        return Cell
    }
    
    @IBAction func Atras(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
