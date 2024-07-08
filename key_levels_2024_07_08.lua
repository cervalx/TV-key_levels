// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels 2024 07 08", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()

// Add levels and comments for QQQ
levels_QQQ.put(502.8,'' )
levels_QQQ.put(500,'v strong level. Lots of gamma here. Will be hard level to break, put delta there will create resistance. Quants max' )
levels_QQQ.put(500.6,'v strong level. Lots of gamma here. Will be hard level to break, put delta there will create resistance. Quants max' )
levels_QQQ.put(498,'' )
levels_QQQ.put(495,'strong level. Call delta here is supportive. MM will therefore try to get price above here.' )
levels_QQQ.put(494,'' )
levels_QQQ.put(493,'another level with quite a bit fo gamma here. Tough level to break.' )
levels_QQQ.put(491.8,'quants min' )
levels_QQQ.put(490,'v strong level. Lots of call delta here.' )
levels_QQQ.put(487.8,'' )
// Add levels and comments for SPX
levels_SPX.put(5600,'quants max' )
levels_SPX.put(5606,'quants max' )
levels_SPX.put(5590,'' )
levels_SPX.put(5575,'top of chop zone.' )
levels_SPX.put(5580,'top of chop zone.' )
levels_SPX.put(5570,'' )
levels_SPX.put(5565,'' )
levels_SPX.put(5545,'strong level. Lots of gamma here.' )
levels_SPX.put(5550,'strong level. Lots of gamma here.' )
levels_SPX.put(5534,'quants min' )
levels_SPX.put(5524,'' )
levels_SPX.put(5510,'' )
levels_SPX.put(55000,'strong support' )
levels_SPX.put(5503,'strong support' )

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
