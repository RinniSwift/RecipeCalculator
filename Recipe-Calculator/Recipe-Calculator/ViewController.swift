//
//  ViewController.swift
//  Recipe-Calculator
//
//  Created by Rinni Swift on 7/22/18.
//  Copyright © 2018 Rinni Swift. All rights reserved.
//

import UIKit

class scrollView: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images:[String] = ["designdocs", "recipecalcdesign1"]
    var frame = CGRect(x:0,y:0,width:0,height:0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        for index in 0..<images.count {
            
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imgView)
            
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(images.count), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNum = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNum)
    }

}

