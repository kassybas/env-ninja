# Env-Ninja

## How to build it
1. Build: `go build .`

## Template file
1. Uses basic standard go templating e.g..
``` example.txt.tpl
My name is {{.name}}!!
```
2. Use environment variables:
export name=“John”
3. Run it:
`./env-ninja example.txt.tpl`
4. Profit:
```
My name is John!!

```

