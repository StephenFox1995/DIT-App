//
//  GenericTextView.swift
//  DIT
//
//  Created by Stephen Fox on 21/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// A generic TextView which can be used across
// the application
class GenericTextView: UITextView {
    
    private var textViewFont: Font = Font()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = textViewFont.getFont(.AvenirNext, fontStyle: .Light, size: 20)
        self.textColor = UIColor.whiteColor()
        self.backgroundColor = UIColor.clearColor()
        self.scrollEnabled = true
        self.editable = false
        self.text = "Lorem Ipsum up the bum bum, fhidhfc iejie ieie cduie icjeic cnjodhf eofhieo heowrf hofhewo fewohohfgowhfohowfohf  hfoehfow fowh ohf ow f hofh ohfohfohfo hohfowf hofhowhf oh ofh owow hfow ow ofhow  hwo hfow hfowh o hwo fow hfowhfow wohfwohfeowhfuoewhfo wh howh eow fiewofhieow hfiewo hefiwoh hfruo oreghrugrfrur uffu freuohfwrhf uiwrffvurhf ruhfu  uf heru r hfu grhie hfroe;o wf owrh iofw hjvrwj foewn wh of3 wre vvbjksnvosheho ew fvhrwui hwi fea firwg fw wk frw hfwe w hfw heow heow hw wh fuewh fuewh fuwerio hfuwo fu ewif uiewh fiewhfiehfiewb fuiewh fiew hfuiewh fuiewh fuiewh ufiweh few buvweb iwbriewbvirehvorwafuberwio;afhruewo; HRUWQfeoruwqa;fehuwqFERUW FERUWIOAHEORUWA H FGUERFHEU H"
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    
    // Sets the text for this view
    // @param text - The text for this view to display
    //func setText(text: String) {
      //  self.text = text
    //}

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
