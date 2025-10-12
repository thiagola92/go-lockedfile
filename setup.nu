rm -rf lockedfile
git clone --filter=blob:none https://github.com/golang/go.git
mv go/src/cmd/go/internal/lockedfile .
mv go/src/internal/abi lockedfile/internal/abi
mv go/src/internal/asan lockedfile/internal/asan
mv go/src/internal/bytealg lockedfile/internal/bytealg
mv go/src/internal/cpu lockedfile/internal/cpu
mv go/src/internal/goarch lockedfile/internal/goarch
mv go/src/internal/goos lockedfile/internal/goos
mv go/src/internal/msan lockedfile/internal/msan
mv go/src/internal/race lockedfile/internal/race
mv go/src/internal/runtime lockedfile/internal/runtime
mv go/src/internal/syscall lockedfile/internal/syscall
rm -rf go

let GO_LOCKEDFILE = "\"cmd/go/internal/lockedfile"
let OUR_LOCKEDFILE = "\"github.com/thiagola92/go-lockedfile/lockedfile"

let GO_INTERNAL = "\"internal"
let GO_LOCKEDFILE_INTERNAL = "\"cmd/go/internal/lockedfile/internal"
let OUR_INTERNAL = "\"github.com/thiagola92/go-lockedfile/lockedfile/internal"

def replace_imports [dir] {
    cd $dir

    ls | where type =~ file | where ($it.name | str ends-with "_test.go") | update name {|r|  "./" + $r.name} | get name | each {|r| rm $r}

    ls | where type =~ file | where ($it.name | str ends-with ".go") | update name {|r|  "./" + $r.name} | get name | each {|r| open $r | str replace --all $GO_LOCKEDFILE $OUR_LOCKEDFILE | save -f $r}
    ls | where type =~ file | where ($it.name | str ends-with ".go") | update name {|r|  "./" + $r.name} | get name | each {|r| open $r | str replace --all $GO_INTERNAL $OUR_INTERNAL | save -f $r}
    ls | where type =~ file | where ($it.name | str ends-with ".go") | update name {|r|  "./" + $r.name} | get name | each {|r| open $r | str replace --all $GO_LOCKEDFILE_INTERNAL $OUR_INTERNAL | save -f $r}

    cd -
}

replace_imports lockedfile
replace_imports lockedfile/internal
replace_imports lockedfile/internal/abi
replace_imports lockedfile/internal/abi/testdata
replace_imports lockedfile/internal/asan
replace_imports lockedfile/internal/bytealg
replace_imports lockedfile/internal/cpu
replace_imports lockedfile/internal/filelock
replace_imports lockedfile/internal/goarch
replace_imports lockedfile/internal/goos
replace_imports lockedfile/internal/msan
replace_imports lockedfile/internal/race
replace_imports lockedfile/internal/runtime
replace_imports lockedfile/internal/runtime/atomic
replace_imports lockedfile/internal/runtime/cgobench
replace_imports lockedfile/internal/runtime/cgroup
replace_imports lockedfile/internal/runtime/exithook
replace_imports lockedfile/internal/runtime/gc
replace_imports lockedfile/internal/runtime/gc/internal
replace_imports lockedfile/internal/runtime/gc/internal/gen
replace_imports lockedfile/internal/runtime/gc/scan
replace_imports lockedfile/internal/runtime/maps
replace_imports lockedfile/internal/runtime/math
replace_imports lockedfile/internal/runtime/startlinetest
replace_imports lockedfile/internal/runtime/strconv
replace_imports lockedfile/internal/runtime/sys
replace_imports lockedfile/internal/runtime/syscall
replace_imports lockedfile/internal/runtime/syscall/linux
replace_imports lockedfile/internal/runtime/syscall/windows
replace_imports lockedfile/internal/runtime/wasitest
replace_imports lockedfile/internal/runtime/wasitest/testdata
replace_imports lockedfile/internal/syscall
replace_imports lockedfile/internal/syscall/execenv
replace_imports lockedfile/internal/syscall/unix
replace_imports lockedfile/internal/syscall/windows
replace_imports lockedfile/internal/syscall/windows/registry
replace_imports lockedfile/internal/syscall/windows/sysdll
