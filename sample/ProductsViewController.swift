//
//  ProductsViewController.swift
//  sample
//
//  Created by Kio Coan on 29/01/18.
//  Copyright © 2018 Caio Sanchez Christino. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

class ProductsViewController: UIViewController , Injectable {
    var api: APIClient!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Quando este método é ativado, o view controller de destino e todos os seus filhos já foram instanciados,
        // apesar de nada ainda ser exibido. Podemos tirar vantagem disto para injetar as dependências. A vantagem de
        // usar este método é que nào importa como o segue foi disparado. Este método sempre é chamado antes da próxima
        // cena ser apresentada ao usuário.
        let injector = Injector<Injectable, APIClient>(callback: {(controller, api) in
            controller.api = api
        })
        injector.inject(into: segue.destination, data: api)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _ = api.getAll()
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                print(event)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

