//
//  Injectable.swift
//  sample
//
//  Created by Caio Sanchez Christino on 21/01/18.
//  Copyright © 2018 Caio Sanchez Christino. All rights reserved.
//

import UIKit

protocol Injectable: class {
    var api: APIClient! {get set}
}

/// Estrutura para injetar dados nos view controllers.
/// - parameters:
///     - ProtocolType: O protocolo cuja conformidade será verificada
///     - InjectableDataType: Tipo do dado a ser injetado.
/// - remarks:
/// O princípio desta estrutura é bem simples. Inicialmente, usamos uma estrutura pela performance. A ativação de
/// métodos em estruturas tende a ser mais rápido pois não há uma fase de busca pois as estruturas não suportam
/// herança e, consequentemente, polimorfismo.
/// Os view controllers são dispostos como uma árvore degenerada. Assim, o método inject é recursivo. O callback de
/// injeção é necessário pois não sabemos de antemão o que deve ser injetado nem onde deve ser injetado. Para evitar
/// a complexidade da reflexão, tentou-se manter isto o mais simples possível.
/// O método inject, portanto, navega pela hierarquia de view controllers procurando por aqueles que estejam em
/// conformidade com o protocolo indicado. Todos aqueles que estiverem em conformidade terão as dependências injetadas
/// através do callback.
struct Injector<ProtocolType, InjectableDataType> {
    typealias InjectorCallback = (ProtocolType, InjectableDataType) -> Void
    let injector: InjectorCallback
    
    init(callback: @escaping InjectorCallback) {
        injector = callback
    }
    func inject(into controller: UIViewController, data: InjectableDataType) {
        if let dest = controller as? ProtocolType {
            injector(dest, data)
        }
        for child in controller.childViewControllers {
            inject(into: child, data: data)
        }
    }
}
