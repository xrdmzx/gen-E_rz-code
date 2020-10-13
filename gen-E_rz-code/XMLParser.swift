//
//  ViewController.swift
//  xml1
//
//  Created by chris richardson on 10/3/20.
//

import UIKit
import XMLCoder

struct GBSet: Decodable{
    let GBSeq: GBSeq
    
}

struct GBSeq: Decodable{
    let GBSeq_locus: String
    let GBSeq_length: String
    let GBSeq_strandedness: String
    let GBSeq_moltype: String
    let GBSeq_definition: String
    let GBSeq_topology: String
    let GBSeq_keywords: String
    let GBSeq_source: String
    let GBSeq_organism: String
    let GBSeq_taxonomy: String
    let GBSeq_sequence: String
//    let GBSeq_feature_table: String
    
}
class XMLParser: UIViewController, XMLParserDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.path(forResource: "sequence", ofType: "xml")
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
        let gbSet = try! XMLDecoder().decode(GBSet.self, from: data)
        super.viewDidLoad()
        let seqId = XMLParserDelegate.self
        let urlString = "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?tool=portal&save=file&log$=seqview&db=nuccore&report=gbc_xml&id=\(seqId)&conwithfeat=on&withparts=on&hide-cdd=on"
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
                
            }
            guard let data = data else {
                print("invalid data!")
                return
                
            }
            print(String(data: data, encoding: .utf8)!)
            
        }.resume()
        
        print(gbSet)
        
    }
    
}
