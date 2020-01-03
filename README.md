# ios-test-resource-download

## Create executable package:

```
swift package init --type executable
```
## Download, resolve and compile dependencies

```
swift build
```
## Execute tests

```
swift test
```
## Execute command

### Only will download the file if the file was modified after 24 hours 

```
swift run ios-test-resource-download -url "https://jsonplaceholder.typicode.com/todos/1" -file "item.json"
```
### Force download 

```
swift run ios-test-resource-download -f -url "https://jsonplaceholder.typicode.com/todos/1" -file "item.json"
```
## Integrate on Bitrise

```
#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x

# run our script
cd TestResourceDownload
swift run ios-test-resource-download \
-url "https://jsonplaceholder.typicode.com/todos/1" \
-file "items.json"
```
## Installing command line tool in your machine

```
$ swift build -c release
$ cd .build/release
$ cp -f ios-test-resource-download /usr/local/bin/ios-test-resource-download
```
