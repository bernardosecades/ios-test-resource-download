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
## References

- https://jsonplaceholder.typicode.com/todos/1
- https://www.swiftbysundell.com/articles/building-a-command-line-tool-using-the-swift-package-manager/
- https://dev.to/mishimay/swift-minimum-getpost-request-codes-1085

## Example curls to phoenix


### Login

```
curl --location --request POST 'https://api.ph-dev.ubeeqo.com/authentication/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=bernardo.menendez@ubeeqo.com' \
--data-urlencode 'password=Sealen2000'
```

### Show details cs-operator

```
curl --location --request GET 'http://api.127.0.0.1.nip.io:8080/user-company/v1/cs-operators/4caad069-6565-4878-bd4b-70f8d4ca1b4f' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik5VSTVSa0l6UVROQ056azNNVUU0UWtJek5rVkROVFEwUmtKRE1URTJRVGRGTVRjNE5ETTFPUSJ9.eyJodHRwczovL3ViZWVxby5jb20vdXNlcl91dWlkIjoiNzcwYWYzMjEtNzBiMS00OWFhLWExN2ItMDY0ZGExZDUzNjdiIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLnViZWVxby5jb20vIiwic3ViIjoiYXV0aDB8NWJlNDU5MzhiOTc1MmM2N2RjZjExYzNiIiwiYXVkIjpbImh0dHBzOi8vYXBpLnBoLWRldi51YmVlcW8uY29tIiwiaHR0cHM6Ly91YmVlcW8uZXUuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTU3Nzk3ODEzNiwiZXhwIjoxNTc4MDY0NTM2LCJhenAiOiJBT0dtMlBOSk1TMjlsbHpqZUFJZEdwVnNRREkwQlpDaiIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgYWRkcmVzcyBwaG9uZSIsImd0eSI6InBhc3N3b3JkIn0.U-0bMFjXUcG0mir7Sf1vVFOztyxD6DLbZA7ma1iIddaqFA7nYTZ7gH3OGX6NrTQNkxh-vCbtWHw3fBw7lweH1yGa1idPhemvQ3HTLaNzC_k2c65Po7yyYaUjBWXDFEQ30Ka4beUY_WLoCpFhUBpVU1kDzgxgDYAdb43GT5s7DLtbgpN_faz2PG8bqhdqphQLGL6-3XlfRumHWR_rS7forNmDr09c4oqXu3oXb6zIyxWZ_Tr803NYAeFm6-_hWPSmnAEERaVzMY1Ls2OZp7yW_lmu_1gy4UU7Guh-SvKaLT0hdl7iL-wRqyuu5Emn-kwFsgQwYbRunUVK_AvY4eUsxg'
```
