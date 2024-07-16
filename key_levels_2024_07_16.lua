// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 07 16", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()

// Add levels and comments for QQQ
levels_QQQ.put(504,'' )
levels_QQQ.put(503.5,'ATH level. Strong resistance there.' )
levels_QQQ.put(500.8,'max' )
levels_QQQ.put(501,'max' )
levels_QQQ.put(500,'' )
levels_QQQ.put(497.5,'key level' )
levels_QQQ.put(496.8,'' )
levels_QQQ.put(495,'' )
levels_QQQ.put(493.5,'strong level from multiple moving averages. Will be hard to break.' )
levels_QQQ.put(493.78,'strong level from multiple moving averages. Will be hard to break.' )
levels_QQQ.put(492,'quants min' )
levels_QQQ.put(490.5 ,'' )
levels_QQQ.put(490,'' )
levels_QQQ.put(488,'' )
// Add levels and comments for SPX
levels_SPX.put(5695,'key level. Strong. It is becoming more magnetic, we see as open interest here increases. can see it achieved soon.' )
levels_SPX.put(5700,'key level. Strong. It is becoming more magnetic, we see as open interest here increases. can see it achieved soon.' )
levels_SPX.put(5675,'' )
levels_SPX.put(5667,'quants max. I think there is risk of this breaking today, so size smaller, but let’s see.' )
levels_SPX.put(5650,'' )
levels_SPX.put(5640,'' )
levels_SPX.put(5625,'' )
levels_SPX.put(5615,'stronger supp' )
levels_SPX.put(5609,'' )
levels_SPX.put(5596,'quants min' )
levels_SPX.put(5600,'quants min' )
levels_SPX.put(5590 ,'' )
levels_SPX.put(5581,'' )
levels_SPX.put(5570,'' )
levels_SPX.put(5575,'' )

// Function to plot levels
plotLevels(levelsMap, line_color, label_color, label_text_color) =>
    keys = map.keys(levelsMap)
    for n = 0 to array.size(keys) - 1
        price = array.get(keys, n)
        comment = map.get(levelsMap, price)
        line.new(bar_index - 1, price, bar_index, price, extend=extend.both, color=line_color)
        label.new(bar_index, y=price, text=comment, style=label.style_label_left, textalign=text.align_left, size=size.small, color=label_color, textcolor=label_text_color)

// Determine which levels to plot based on the symbol
if syminfo.ticker == "QQQ"
    plotLevels(levels_QQQ, line_color, label_color, label_text_color)
else if syminfo.ticker == "SPX"
    plotLevels(levels_SPX, line_color, label_color, label_text_color)
