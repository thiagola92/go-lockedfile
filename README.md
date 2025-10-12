# go-lockedfile

```bash
git clone --filter=blob:none https://github.com/golang/go.git

mv go/src/cmd/go/internal/lockedfile .
mv go/src/internal/testenv lockedfile/internal/testenv
mv go/src/internal/platform lockedfile/internal/platform
mv go/src/internal/diff lockedfile/internal/diff
mv go/src/internal/txtar lockedfile/internal/txtar

rm -rf go
```