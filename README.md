# Trading data Downloader for Gekko Trading Bot
Uses F1LT3R's chart downloader and haxus's json to .db converter script(modified by agrimaldi). Gets the carts from https://bitcoincharts.com/  
instructions from: http://gekkowarez.com/download-category/trading-data/

## Usage
Basically you download this thing. Apply the stuff i wrote and after you executed the sciprt you get a xxx.db file. you copy it into history folder of you geekko bot and use for backtesting. I've no idea what are those fixes about.


```
git clone https://github.com/F1LT3R/bitcoin-scraper.git
sudo apt-get install sqlite3
cd bitcoin-scraper
npm install
```

### Fix Bugs if not already done by the developer meanwhile
### Font fix
```
cd node_modules/figlet/fonts/
wget http://www.textfiles.com/art/pepper.flf
cd ../../../
```

#### spelling fix
```
sed -i 's/pepper/Pepper/' combine.js
sed -i 's/pepper/Pepper/' scrape.js
```
#### Fix the URL to get minute candles instead of hour candles:
```
sed -i 's/r=60/r=1/g' scrape.js
```

Configure the market you want to download
by changing “const market = ‘bitstampUSD’“ to
whatever you want, plz see
https://bitcoincharts.com/charts (symbols) for more detailes  
  
const market = ‘bitstampUSD’

#### You may also change the timeframe within that file
const dates = {
from: {
year: 2011,
month: 9,
day: 14
},

to: {
year: 2017,
month: 08,
day: 9
},
}

#### Now let us do the magic
```
./convertDB_2.sh
```
```
mv data/bitstamp_0.1.db /Path/To/Gekko/history/
```

## The rest of the readme is about bitcoin-scraper and not gekko


Scrape the entire Bitcoin chart history to JSON.

![Screenshot](screenshot.jpg)

## Install & Scrape

```shell
git clone https://github.com/F1LT3R/bitcoin-scraper.git
cd bitcoin-scraper
npm install
mkdir data
node scrape.js
```

## Output Example

```shell
  _                 _              _
 /_)._/__  _  ._   / `/_ _  __/_  /_`_  __  _  _  _
/_)/ / /_ /_/// / /_,/ //_|/ /   ._//_ //_|/_//_'/
                                          /
Running with maxstreams=8

Fetching: 2017-8-9
Fetching: 2017-8-8
Fetching: 2017-8-7
Fetching: 2017-8-6
Fetching: 2017-8-5
Fetching: 2017-8-4
Fetching: 2017-8-3
Fetching: 2017-8-2
Recevied: 2017-8-3
Saved to: data/bitstampUSD-2017-8-3.json
Recevied: 2017-8-9
Saved to: data/bitstampUSD-2017-8-9.json
Recevied: 2017-8-6
Saved to: data/bitstampUSD-2017-8-6.json
Recevied: 2017-8-7
Saved to: data/bitstampUSD-2017-8-7.json
...
DONE!
```

## Data Structure

```json
[
  [
    1419033600,
    318.58,
    318.58,
    318.58,
    318.58,
    0.01719605,
    5.478317609,
    318.58
  ],
  ...
```

## Columns

| Timestamp  |  Open  |  High  |  Low   | Close  | Volume (BTC) | Volume (Currency) | Weighted Price (USD) |
|------------|--------|--------|--------|--------|--------------|-------------------|----------------------|
| 1419033600 | 318.58 | 318.58 | 318.58 | 318.58 |   0.01719605 |       5.478317609 |               318.58 |


## Le Combine...

Combine all data into one file sequentially.

```shell
node combine.js data/bitcoin-history.json
```

## Chart...

![Chart Bitcoin Moores Law - Logarithmic Y axis dollars](log-moore-btc.jpg)

```shell
npm install http-server -g
http-server
# point your browser to http://localhost:8080/chart.html
```
