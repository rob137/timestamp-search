# Open Video at Keyword Matches

Expects `timestamps.txt` and `video.mp4`.  The timestamps should be in the format `hours:mins:secs`, like this:
```
00:02:01 npm and use of shrinkwrap
00:18:05 Differences between observables and promises
01:02:30 e2m testing
```

## Usage

1. Clone the repository and run `npm install`.
2. Set execute permission on `match.sh`.
3. Move a video into the directory as `video.mp4
4. Run `./match.sh query`, where 'query' is a keyword you want to find in the video.
