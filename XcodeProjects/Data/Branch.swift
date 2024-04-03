//
//  Branch.swift
//  XcodeProjects
//
//  Created by zQiu on 2024/4/3.
//  Copyright © 2024 com.klm.mac.myProjects. All rights reserved.
//

import Foundation

class Branch: ObservableObject {
    
    let path: String
    
    @Published
    var name: String = ""
    
    init(path: String) {
        self.path = path
        self.update()
    }
    
    func update() {
        // /Users/zqiu/Projects/lrts-ios/iphone2_0
        let git = (path as NSString).deletingLastPathComponent
        let ref = (try? String(contentsOfFile: git + "/.git/HEAD"))
        let bra = ref?.components(separatedBy: "heads/").last
        name = bra?.replacingOccurrences(of: "\n", with: "") ?? ""
    }
}
