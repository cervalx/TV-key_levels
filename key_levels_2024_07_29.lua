// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 07 29", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()
levels_VIX = map.new<float, string>()

// Add levels and comments for SPX
levels_SPX.put(5545,'' )
levels_SPX.put(5535,'stronger resistance' )
levels_SPX.put(5525,'' )
levels_SPX.put(5505,'' )
levels_SPX.put(5500,'key level' )
levels_SPX.put(5490,'' )
levels_SPX.put(5480,'' )
levels_SPX.put(5470,'' )
levels_SPX.put(5450,'strong level support level, with 50HR MA.' )
levels_SPX.put(5435,'min' )
levels_SPX.put(5421,'' )
// Add levels and comments for QQQ
levels_QQQ.put(473,'' )
levels_QQQ.put(471,'' )
levels_QQQ.put(470,'quant max' )
levels_QQQ.put(469,'' )
levels_QQQ.put(467.7,'' )
levels_QQQ.put(465 ,'' )
levels_QQQ.put(463,'key level' )
levels_QQQ.put(462.3,'relates to 19k on NASDAq, will be a key level.' )
levels_QQQ.put(461,'' )
levels_QQQ.put(460,'min' )
levels_QQQ.put(458.8,'' )

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
    
