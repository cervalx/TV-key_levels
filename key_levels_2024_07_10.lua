// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 07 10", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()

// Add levels and comments for QQQ
levels_QQQ.put(503.8,'' )
levels_QQQ.put(502,'quants max' )
levels_QQQ.put(502.8,'quants max' )
levels_QQQ.put(500,'v strong level' )
levels_QQQ.put(498,'498.4' )
levels_QQQ.put(497,'497.3' )
levels_QQQ.put(496,'496.3' )
levels_QQQ.put(495,'significant level' )
levels_QQQ.put(494,'quants min' )
levels_QQQ.put(494.4,'quants min' )
levels_QQQ.put(493,'' )
levels_QQQ.put(492.5,'' )
// Add levels and comments for SPX
levels_SPX.put(5646,'' )
levels_SPX.put(5630,'' )
levels_SPX.put(5611,'quants max' )
levels_SPX.put(5600,'strong resistance. Will take a lot of volume to break' )
levels_SPX.put(5588,'' )
levels_SPX.put(5575,'' )
levels_SPX.put(5580,'' )
levels_SPX.put(5565,'' )
levels_SPX.put(5550,'quants min' )
levels_SPX.put(5553,'quants min' )
levels_SPX.put(5542,'if 5550 breaks, look here for min' )
levels_SPX.put(5530,'' )
levels_SPX.put(5515,'' )

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
