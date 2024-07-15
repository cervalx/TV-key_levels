// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 07 15", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()

// Add levels and comments for QQQ
levels_QQQ.put(503,'' )
levels_QQQ.put(500 MAX,'' )
levels_QQQ.put(497.6,'strong level' )
levels_QQQ.put(498,'strong level' )
levels_QQQ.put(497 ,'' )
levels_QQQ.put(495,'' )
levels_QQQ.put(493.75,'' )
levels_QQQ.put(492,'strong level. will be hard to break.Can find support here on any pullback.' )
levels_QQQ.put(490,'min, unlikely to drop this much though IMO' )
levels_QQQ.put(488,'' )
// Add levels and comments for SPX
levels_SPX.put(5675,'' )
levels_SPX.put(5661,'quant max' )
levels_SPX.put(5650,'v strong level. This will be tough to break IMO' )
levels_SPX.put(5655,'v strong level. This will be tough to break IMO' )
levels_SPX.put(5635,'' )
levels_SPX.put(5625,'' )
levels_SPX.put(5611,'' )
levels_SPX.put(5583,'quant's min. I dont think 5595 will break though, but let's see.' )
levels_SPX.put(5575,'' )
levels_SPX.put(5567,'' )
levels_SPX.put(5550,'strong level' )

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
