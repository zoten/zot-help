# JSON Crack

Nice tool to visualize JSON documents, thanks to [Edoardo Costantini](https://github.com/edoardocostantinidev)

``` bash
git clone git@github.com:AykutSarac/jsoncrack.com.git
cd jsoncrack.com
docker build -t jsoncrack .
```

run

``` bash
docker run -p 8888:8080 jsoncrack
```

go to [localhost](http://localhost:8888)

(you can also run locally, but I don't like to clunk my machine with npm stuff)

``` bash
npm install
npm run dev
```
