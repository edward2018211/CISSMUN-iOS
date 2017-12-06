//
//  MoreViewController.swift
//  CISSMUN
//
//  Created by Stanley Liu on 7/9/17.
//  Copyright © 2017 Stanley Liu. All rights reserved.
//

import UIKit

class MoreScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openContact(_ sender: Any) {
        
        if (UserDefaults.standard.object(forKey: "myConference") as? Bool)! {
            let controller = storyboard?.instantiateViewController(withIdentifier: "MUNContact")
            navigationController?.pushViewController(controller!, animated: true)

            
        } else {
            let controller = storyboard?.instantiateViewController(withIdentifier: "GINContact")
            navigationController?.pushViewController(controller!, animated: true)
        }
    }
    
    @IBAction func openPDF(_ sender: UIButton) {
        let pdfVC = storyboard?.instantiateViewController(withIdentifier: "pdfviewer") as! MUNPDFViewController
        pdfVC.stringPassed = sender.accessibilityIdentifier!
        navigationController?.pushViewController(pdfVC, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
