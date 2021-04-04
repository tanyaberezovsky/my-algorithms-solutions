import Foundation
//https://practice.geeksforgeeks.org/problems/spirally-traversing-a-matrix/0

func printSpirally(mat: [[Int]], rows: Int, columns: Int) {
    
    var startColumnInd = 0
    var endColumnInd = columns - 1
    
    var startRowInd = 0
    var endRowInd = rows - 1
    
    while startColumnInd < endColumnInd || startRowInd < endRowInd {
        //print upper column; row run
        //  print("case 1")
        for c in startColumnInd ..< endColumnInd + 1 {
            print(mat[startRowInd][c])
        }
        startRowInd = startRowInd + 1
        //
        
        //print rightest row
      //  print("case 2")
        for r in startRowInd ..< endRowInd + 1 {
           // print(r)
            print(mat[r][endColumnInd])
        }
        endColumnInd = endColumnInd - 1
        
        //print latest row
   //     print("case 3")
        if (startColumnInd < endColumnInd) {
        for c in (startColumnInd ..< endColumnInd + 1).reversed() {
          //  print(c)
            print(mat[endRowInd][c])
        }
        }
        endRowInd = endRowInd - 1
        
        //print left row
//        print("case 4")
//        print(startRowInd)
//        print(endRowInd)
//        print(" startCol \(startColumnInd)")
        if startRowInd < endRowInd + 1 {
            for r in ( startRowInd ..< endRowInd + 1).reversed() {
               // print("r\(r) startCol \(startColumnInd)")
              //  print(r)
                print(mat[r][startColumnInd])
            }
        }
        startColumnInd = startColumnInd + 1
        
        
    }
}
//printSpirally(mat: [[1,2,3,4]], rows: 1, columns: 4)
printSpirally(mat: [[1,2,3,4],[5,6,7,8],[9,10,11,12]], rows: 3, columns: 4)

printSpirally(mat: [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], rows: 4, columns: 4)
