// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 07 22", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()
levels_VIX = map.new<float, string>()

// Add levels and comments for QQQ
levels_QQQ.put(486.5,'corresponds to 20k level. This would be the line in the sand most likely.' )
levels_QQQ.put(484.7,'' )
levels_QQQ.put(483.3,'quants max' )
levels_QQQ.put(481.7 ,'' )
levels_QQQ.put(481,'stronger resistance' )
levels_QQQ.put(480,'key level' )
levels_QQQ.put(477,'' )
levels_QQQ.put(475,'' )
levels_QQQ.put(474,'min' )
// Add levels and comments for SPX
levels_SPX.put(5595,'v strong level' )
levels_SPX.put(5600,'v strong level' )
levels_SPX.put(5585,'' )
levels_SPX.put(5577,'' )
levels_SPX.put(5565,'quants max' )
levels_SPX.put(5550,'strong resistance' )
levels_SPX.put(5543,'key level' )
levels_SPX.put(5525,'' )
levels_SPX.put(5490,'min' )
levels_SPX.put(5500,'min' )
levels_SPX.put(5485,'' )
levels_SPX.put(5477,'' )
// Add levels and comments for VIX
levels_VIX.put(17,'which it receded from in premarket.' )
levels_VIX.put(16 ,'' )
levels_VIX.put(15,'strong level hard to break.' )

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
    
