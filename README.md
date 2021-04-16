# Dataset: News Crawl

Downloading data from [News Crawl](http://data.statmt.org/news-crawl/) with
[wget](https://www.gnu.org/software/wget/).

Data links originally found through [flauBERT](https://github.com/getalp/Flaubert).

```bash
./download.sh [language-code]
```

The list of available codes is provided when running `./download.sh` without
argument. The script will create a folder, `news-crawl`, and download the files
in there.
