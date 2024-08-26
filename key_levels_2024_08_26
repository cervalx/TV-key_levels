// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 08 26", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()
levels_VIX = map.new<float, string>()

// Add levels and comments for SPX
levels_SPX.put(5700,'' )
levels_SPX.put(5690,'' )
levels_SPX.put(5673,'strong resistance, quant codes this as a max' )
levels_SPX.put(5663,'top of iron condor' )
levels_SPX.put(5640,'' )
levels_SPX.put(5650,'' )
levels_SPX.put(5620,'' )
levels_SPX.put(5605,'' )
levels_SPX.put(5595,'bottom of iron condor' )
levels_SPX.put(5582,'' )
levels_SPX.put(5575,'' )
// Add levels and comments for QQQ
levels_QQQ.put(487,'' )
levels_QQQ.put(486,'strong level' )
levels_QQQ.put(485.5,'previous highs, max' )
levels_QQQ.put(485,'' )
levels_QQQ.put(483,'' )
levels_QQQ.put(480,'strong level' )
levels_QQQ.put(479.3,'' )
levels_QQQ.put(476.1,'' )
levels_QQQ.put(474.6,'min' )
levels_QQQ.put(473.8,'key level' )
levels_QQQ.put(473,'' )

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
else if syminfo.ticker == "VIX"
    plotLevels(levels_VIX, line_color, label_color, label_text_color)
    
