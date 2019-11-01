# artillery-test

## Run a load test

#### Examples

```
# Run load test with ARRIVAL_RATE 25 for 60s and get urls from https://example.com/urls.txt
docker run -it -d 60 -a 25 -f "https://example.com/urls.txt"
```

```
# Run load test with ARRIVAL_RATE 25 for 60s and get urls from https://example.com/urls.txt and save the result in your current folder under result.json
docker run -it -v "$PWD":/usr/src/app -w /usr/src/app -d 60 -a 25 -f "https://example.com/urls.txt" -o result.json
```