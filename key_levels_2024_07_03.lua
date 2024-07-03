// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()

// Add levels and comments for QQQ
levels_QQQ.put(5573,'' )
levels_QQQ.put(5550,'strong resistance' )
levels_QQQ.put(553,'strong resistance' )
levels_QQQ.put(5540,'quants max' )
levels_QQQ.put(5545,'quants max' )
levels_QQQ.put(5525,'' )
levels_QQQ.put(5510,'' )
levels_QQQ.put(5500, 'key level' )
levels_QQQ.put(5490 ,'' )
levels_QQQ.put(5475,'min' )
levels_QQQ.put(5462,'if quants min breaks, id be looking here.' )
levels_QQQ.put(5465,'if quants min breaks, id be looking here.' )
levels_QQQ.put(5450,'key level' )
levels_QQQ.put(5435,'' )
// Add levels and comments for SPX
levels_SPX.put(490,'quants max' )
levels_SPX.put(486.7,'corresponds to 20k on NDX' )
levels_SPX.put(487,'corresponds to 20k on NDX' )
levels_SPX.put(486,'' )
levels_SPX.put(485,'' )
levels_SPX.put(484.1,'' )
levels_SPX.put(482.3,'potential quant min.' )
levels_SPX.put(482.5,'potential quant min.' )
levels_SPX.put(481.5,'if min breaks, look here for support imo.' )
levels_SPX.put(481,'' )
levels_SPX.put(480,'strong support' )

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
