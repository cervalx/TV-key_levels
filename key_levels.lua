// This Pine Script™ code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © cervalx

//@version=5
indicator("key levels", overlay = true)

line_color = input.color(color.blue)
label_color = input.color(color.blue)
label_text_color = input(color.white)

levels_QQQ = map.new<float, string>()
levels_SPX = map.new<float, string>()

// LEVELS VALUES ************* //
// Add levels and comments for QQQ
levels_QQQ.put(485, 'if quants max breaks, this is likely to be the strong resistance')
levels_QQQ.put(485.2, 'if quants max breaks, this is likely to be the strong resistance')
levels_QQQ.put(483, 'possible max')
levels_QQQ.put(483.5, 'possible max')
levels_QQQ.put(482.4, '')
levels_QQQ.put(481, 'key hedging level')
levels_QQQ.put(480, '')
levels_QQQ.put(479, 'strong support')
levels_QQQ.put(478, '')
levels_QQQ.put(476, 'min')
levels_QQQ.put(476.2, 'min')
levels_QQQ.put(475, '')
// Add levels and comments for SPX
levels_SPX.put(5525, 'unlikely')
levels_SPX.put(5506, 'technically quants max, but I think 5500 will be hard to breach')
levels_SPX.put(5510, 'technically quants max, but I think 5500 will be hard to breach')
levels_SPX.put(5500, 'v strong resistance')
levels_SPX.put(5480, '')
levels_SPX.put(5475, '')
levels_SPX.put(5465, '')
levels_SPX.put(5450, 'pivot level still')
levels_SPX.put(5455, 'pivot level still')
levels_SPX.put(5440, 'quants min')
levels_SPX.put(5445, 'quants min')
levels_SPX.put(5425, 'strong supp')
levels_SPX.put(5430, 'strong supp')
levels_SPX.put(5412, '')
levels_SPX.put(5400, '')
// ************* ************* //

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
