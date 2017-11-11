//
//  ViewController.swift
//  Castels
//
//  Created by Govind Lokhande on 2017-11-11.
//  Copyright © 2017 Govind Lokhande. All rights reserved.
//
//  XCODE Version - 8.0
//

import UIKit

class CastlesCreation: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stretchLandheightsList:[Int] =  [0,6,6,6,2,5,8,7,7,7,7,9]
        
        if(stretchLandheightsList.count>0) {
            
            var numberOfCastels = numberOfCastlestoBuild(stretchedLandHeight: stretchLandheightsList)
            numberOfCastels.insert(stretchLandheightsList[0], at: 0)
            print("Casteles to be build",numberOfCastels)
        }
        
    }
    
    func numberOfCastlestoBuild(stretchedLandHeight:[Int])->[Int] {
        
        //declaring two arrayList for adding peak values and valley values.
        var peaksArray:[Int] = []
        var valleysArray:[Int] = []
        let lengthOflandHeightValueArray:Int = stretchedLandHeight.count;
        
        /* Iterate through the array to find out peak and valley values from the given array.
         Peak - A peak is an integer or series of integers that is above the immediately preceding and following
         ints. For example, in the sequence [2,6,6,6,3] the sequence of 3 6s is a peak.
         Valley - A valley is an integer or series of integers that is below the immediately preceding and
         following ints. For example, in the sequence [6,1,4] the "1" would be a valley.
         Start iteration from the first value as for finding the peak or valley, we have to compare that element with its previous
         and next element. So for the first and last element, this condition fails.
         */
        
        for  i in 1  ..< lengthOflandHeightValueArray {
            
            /*
             If the previous value is less than the current value, check for the duplicate digits
             immediately following the current element.
             Get the position of last duplicate element, and compare the next position element value with the current value.
             If the value is less than the current value then the current value is the peak value.
             Add that value in peak list.
             Apply the same login for finding the valley values as well and add that value in the valley list.
             The number of crastles = Number of Peaks + Number of Valleys.
             The first if block is for finding peak list.
             */

            if(stretchedLandHeight[i-1] < stretchedLandHeight[i]) {
                
                
                var j:Int = i + 1
                
                while (j !=  lengthOflandHeightValueArray && stretchedLandHeight[i] == stretchedLandHeight[j]) {
                    j += 1
                }
                
                if(j == lengthOflandHeightValueArray){
                    j -= 1
                }
                
                if(stretchedLandHeight[i] > stretchedLandHeight[j]){
                    peaksArray.append(stretchedLandHeight[i])
                }
            }
            
             // This if block is used for finding valley list.
            
            if(stretchedLandHeight[i-1] > stretchedLandHeight[i]) {
                
                var j:Int = i + 1
                
                while (j !=  lengthOflandHeightValueArray && stretchedLandHeight[i] == stretchedLandHeight[j]) {
                    j += 1
                }
                
                if(j == lengthOflandHeightValueArray){
                    j -= 1
                }
                
                if(stretchedLandHeight[i] < stretchedLandHeight[j]){
                    valleysArray.append(stretchedLandHeight[i])
                }
            }
        }
        
        print("Peak Values -> \(peaksArray)")
        print("Valley Values -> \(valleysArray)")
        
        // Number of Castles = First Element + Peak List Size + Valley List Size
        
        return peaksArray + valleysArray
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

