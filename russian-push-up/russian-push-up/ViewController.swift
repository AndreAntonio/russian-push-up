//
//  ViewController.swift
//  russian-push-up
//
//  Created by Andre Faruolo on 10/07/17.
//  Copyright © 2017 Andre Faruolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Esse outlet é responsavel por apresentar ao usuario a semana do programa em que ele atualmente se encontra.
    @IBOutlet weak var weekOutlet: UILabel!
    
    // Esse outlet é responsavel por apresentar ao usuario o dia da semana (segunda, terça etc...) em que o usuario se encontra, sem relação ao programa.
    @IBOutlet weak var weekDayOutlet: UILabel!
    
    // Esse outlet representa o dia do programa em que ele se encontra. ( Ex : segundo dia)
    @IBOutlet weak var dayOutlet: UILabel!
    
    // Esse outlet representa o maximo de flexões do usuario, atualmente. A medida que novos testes forem feitos, o maximo aumenta.
    @IBOutlet weak var currentMaximumOutlet: UILabel!
    
    // Esse outlet representa a relative intensity correspondente ao dia/semana do programa que o usuario se encontra.
    @IBOutlet weak var relativeIntensityOutlet: UILabel!
    
    // Esse outlet representa o numero de PushUps que o usuario deverá fazer em seguida. Depende diretamente de seu maximo e de sua relative intensity.
    @IBOutlet weak var psOutlet: UILabel!
    
    // Esse outlet representa quantos minutos faltam para a proxima flexao.
    @IBOutlet weak var MinOutlet: UILabel!
    
    // Esse Outlet representa a casa dos segundos do outlet acima.
    @IBOutlet weak var SecOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToScheduleTapped(_ sender: Any) {
        
        // Essa action é responsavel por levar o usuario ao ScheduleViewController.
        
    }
    
    @IBAction func goToInfoTapped(_ sender: Any) {
        
        // Essa action é responsavel por levar o usuario ao InfoPageViewController.
        
    }
    
    


}
