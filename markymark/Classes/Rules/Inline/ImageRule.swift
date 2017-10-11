//
//  Created by Jim van Zummeren on 03/05/16.
//  Copyright © 2016 M2mobi. All rights reserved.
//

import Foundation

open class ImageRule : InlineRegexRule {
    
    public init() {}

    /// Example: ![Alt text](image.png)
    public var expression = NSRegularExpression.expressionWithPattern("(!\\p{Z}{0,1})\\[{0,1}(.+?)\\]\\({1}(.+?)\\)")

    public func createMarkDownItemWithLines(_ lines:[String]) -> MarkDownItem {

        let file:String? =  lines.first?.subStringWithExpression(expression, ofGroup: 3)
        let altText:String? =  lines.first?.subStringWithExpression(expression, ofGroup: 2)
        
        return ImageMarkDownItem(lines: lines, file: file ?? "", altText: altText ?? "")
    }
}
