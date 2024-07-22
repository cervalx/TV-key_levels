Instructions to use the script
1. Must be in full chart mode on the desired symbol (QQQ or SPX)
2. Open PineScript editor
   <img width="1212" alt="Screenshot 2024-06-30 at 16 38 01" src="https://github.com/dreamless2871/TV-key_levels/assets/125916318/d7de26d1-45c1-4d33-a8cf-656c3f163158">
3. Create new script by opening template new indicator
4. Copy the contents of the script for the desired date into the window
<img width="1660" alt="Screenshot 2024-06-30 at 16 44 19" src="https://github.com/dreamless2871/TV-key_levels/assets/125916318/fba9872b-0791-4992-8dc6-edfd52ed065f">
- The script does not update automatically and must be manually copied every day.

In order to process the post lines I use two tools:
1. https://capitalizemytitle.com/tools/column-to-comma-separated-list/
With the following settings
<img width="307" alt="Screenshot 2024-07-16 at 15 12 31" src="https://github.com/user-attachments/assets/7cd128b9-f3c2-4da7-ace8-74f4f48b1d2e">

That generates a string array example:
```python
'5695-5700 - key level. Strong. It is becoming more magnetic, we see as open interest here increases. can see it achieved soon.;5675;5667 - quants max. I think there is risk of this breaking today, so size smaller, but let’s see. ;5650;5640;5625;5615 - stronger supp;5609;5596-5600 - quants min;5590 ;5581;5570-5575'
```
3. I process the array using a custom Python script in a online Jupyter notebook (on (https://colab.research.google.com): Tear_Levels.ipynb
