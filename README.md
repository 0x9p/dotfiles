```
# minimum needed for go module to work
go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/stamblerre/gocode@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/cweill/gotests/...@latest
go install github.com/fatih/gomodifytags@latest

# gopls for (+lsp)
go install golang.org/x/tools/gopls@latest

# golangci
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```

```
SPC b b - show all open buffers
SPC b k - kill current buffer
SPC b O - kill other buffers besides current one

SPC c d - go to definition
SPC c D - go to references
SPC c I - go to implementation

SPC . - open finder

g g - go to first line
G - go to last line

SHIFT $ - go to end of line
0 - go to start of line

d d - delete line

TAB - collapse / expand
Shift + TAB - collapse all
Shift + TAB (2x) - expand all
```