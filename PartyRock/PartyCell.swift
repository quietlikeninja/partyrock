//
//  PartyCell.swift
//  PartyRock
//
//  Created by Justin Ward on 27/2/17.
//  Copyright © 2017 Justin Ward. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        //async is background thread allows UI to continue running
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                //sync is main thread
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle the error
            }
        }
        
    }
}
