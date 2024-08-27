// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 08 27", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()
levels_VIX = map.new<float, string>()

// Add levels and comments for SPX
levels_SPX.put(5700,'' )
levels_SPX.put(5675,'' )
levels_SPX.put(5660,'top of iron condor (likely max)' )
levels_SPX.put(5665,'top of iron condor (likely max)' )
levels_SPX.put(5650,'' )
levels_SPX.put(5620,'' )
levels_SPX.put(5600,'key level' )
levels_SPX.put(5595,'bottom of iron condor.' )
levels_SPX.put(5587,'' )
levels_SPX.put(5575,'expected min, if iron condor breaks.' )
levels_SPX.put(5562,'' )
levels_SPX.put(5550,'' )
levels_SPX.put(5528,'' )
// Add levels and comments for QQQ
levels_QQQ.put(481.2,'' )
levels_QQQ.put(479.66,'max' )
levels_QQQ.put(478.6,'' )
levels_QQQ.put(477.5,'' )
levels_QQQ.put(476.5,'stronger level' )
levels_QQQ.put(475,'' )
levels_QQQ.put(473.8,'' )
levels_QQQ.put(474,'' )
levels_QQQ.put(471.58,'key strong level. Will try hard to hold this level' )
levels_QQQ.put(470,'min' )
levels_QQQ.put(468.3,'' )
levels_QQQ.put(467.4,'' )

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
    
