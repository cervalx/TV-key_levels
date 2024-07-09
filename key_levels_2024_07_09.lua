// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 07 09", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()

// Add levels and comments for QQQ
levels_QQQ.put(504,'' )
levels_QQQ.put(503,'' )
levels_QQQ.put(501.5,'quants max' )
levels_QQQ.put(502,'quants max' )
levels_QQQ.put(500,'strong level' )
levels_QQQ.put(497,'' )
levels_QQQ.put(495,'strong level' )
levels_QQQ.put(494,'quants min' )
levels_QQQ.put(494.2,'quants min' )
levels_QQQ.put(493,'if quants min breaks look towards 493.' )
levels_QQQ.put(490,'' )
// Add levels and comments for SPX
levels_SPX.put(5610,'' )
levels_SPX.put(5600,'quants max' )
levels_SPX.put(5606,'quants max' )
levels_SPX.put(5591,'' )
levels_SPX.put(5575,'' )
levels_SPX.put(5580,'' )
levels_SPX.put(5560,'' )
levels_SPX.put(5550 ,'is still the pivot level. Strong support. Will need strong volume to break this.' )
levels_SPX.put(5538,'quants min, unlikely imo.' )
levels_SPX.put(5540,'quants min, unlikely imo.' )
levels_SPX.put(5528,'' )
levels_SPX.put(5532,'' )
levels_SPX.put(5520,'' )
levels_SPX.put(5500,'v strong level.' )
levels_SPX.put(5505,'v strong level.' )

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
