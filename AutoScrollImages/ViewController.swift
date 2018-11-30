//
//  ViewController.swift
//  AutoScrollImages
//
//  Created by PASHA on 30/11/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  @IBOutlet weak var imageCV: UICollectionView!
  
  var myTimer = Timer()
  var imageArr = ["image1.jpeg","image2.jpeg","image3.jpeg","image4.jpeg","image5.jpeg","image6.jpeg","image7.jpeg","image8.jpeg"]
  override func viewDidLoad() {
    super.viewDidLoad()
    imageCV.delegate = self
    imageCV.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageVCell", for: indexPath) as! ImageVCell
    cell.bannerImageV.image = UIImage(named:"\(imageArr[indexPath.row])")
    
    var rowIndex = indexPath.row
    let numberArrCount:Int = imageArr.count - 1
    
    if rowIndex < numberArrCount {
      rowIndex = (rowIndex + 1)
    }
    else
    {
      rowIndex = 0
    }
    myTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollImages(myTime:)), userInfo: rowIndex, repeats: true)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  let size = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    return size
  }
  
  @objc func scrollImages(myTime:Timer){

    UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
    
      self.imageCV.scrollToItem(at: IndexPath(row: myTime.userInfo! as! Int, section: 0), at: .centeredHorizontally, animated: false)
    }, completion: nil)
}
}
