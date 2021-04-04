import Foundation

protocol TableItem {
   func getCellValue() -> String
}
struct Header {
    // Header stuff
    var headerID:String
}
extension Header: TableItem {
    func getCellValue() -> String {
        return ""
    }
}
struct Zone {
    // Item stuff
    var zoneId: String
}

extension Zone: TableItem {
    func getCellValue() -> String {
        return ""
    }
}
// Then your array can store objects that implement TableItem
//let arr: [TableItem] = [Header(), Item()]


struct Shortcuts {
    var cellValue: String {
       return item.getCellValue()
    }
    var isHidden: Bool
    var item: TableItem
}

var shortcutsArray = [Shortcuts]()

shortcutsArray.append(Shortcuts(isHidden: true, item: Zone(zoneId: "sg56")))

shortcutsArray.append(Shortcuts(isHidden: true, item: Header(headerID: "sg56")))
print(shortcutsArray.count)

//
//for item in arr {
//    if item is Header {
//        print("it is a Header")
//    } else if item is Item {
//        print("it is an Item")
//    }
//}
