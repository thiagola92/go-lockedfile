# go-lockedfile
Fork of Go [lockedfile](https://pkg.go.dev/cmd/go/internal/lockedfile), but includes `TryLock()`.  

## recreate
Is possible to recreate the base of the project executing the [nushell](https://www.nushell.sh/) script `setup.nu`.  

```
nu setup.nu
```

It will:  
- Remove previous *lockedfile* directory
- Clone *Go* repository
- Move packages to our repository
- Remove *Go* repository
- Remove test files (to avoid needing more internal packages)
- Update `import`s to redirect internals to our repository

After this, we must manually implement any "try lock" method. Most of them are a copy of the "lock" methods but changing a flag and removing the for loop.  

## references

- https://man7.org/linux/man-pages/man2/F_SETLK.2const.html
- https://man7.org/linux/man-pages/man2/flock.2.html
- https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-lockfileex
- https://go.dev/doc/modules/publishing