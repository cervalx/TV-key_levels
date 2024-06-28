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
levels_QQQ.put(489,'' )
levels_QQQ.put(486.5,'max. Corresponds closely to the 20k level on NDX. That will be a hard resistance point.' )
levels_QQQ.put(486.7,'max. Corresponds closely to the 20k level on NDX. That will be a hard resistance point.' )
levels_QQQ.put(486.11 ,'' )
levels_QQQ.put(485,'' )
levels_QQQ.put(484,'' )
levels_QQQ.put(482,'' )
levels_QQQ.put(480.7,'' )
levels_QQQ.put(481,'' )
levels_QQQ.put(480,'possible min. Strong support here.' )
levels_QQQ.put(479,'' )
levels_QQQ.put(477,'' )
levels_SPX.put(5550,'' )
levels_SPX.put(5541,'strong resistance if quants max breaks.' )
levels_SPX.put(5525,'quants max' )
levels_SPX.put(5530,'quants max' )
levels_SPX.put(5506,'' )
levels_SPX.put(5510,'' )
levels_SPX.put(5500,'key level' )
levels_SPX.put(5480,'' )
levels_SPX.put(5475,'' )
levels_SPX.put(5465,'strong support/pivot' )
levels_SPX.put(5450,'quants min' )
levels_SPX.put(5440,'' )
levels_SPX.put(5435,'strong support' )
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
