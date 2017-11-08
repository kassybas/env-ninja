package main

import (
	"fmt"
	"html/template"
	"io/ioutil"
	"os"
	"strings"

	log "github.com/sirupsen/logrus"
)

func check(err error) {
	if err != nil {
		panic(err)
	}
}

func readFile(fileName string) string {
	dat, err := ioutil.ReadFile(fileName)
	check(err)
	return string(dat)
}

func createMap() map[string]string {
	m := make(map[string]string)
	for _, e := range os.Environ() {
		pair := strings.SplitN(e, "=", 2)
		m[pair[0]] = pair[1]
	}
	return m
}

func renderTemplateToFile(m map[string]string, text, outFileName string) {
	f, err := os.Create(outFileName)
	check(err)
	t, err := template.New("templ").Parse(text)
	check(err)
	err = t.Execute(f, m)
	fmt.Printf("Executed template, saved file: %s\n", outFileName)
	f.Close()
}

func main() {
	log.SetLevel(log.DebugLevel)

	fileName := os.Args[1]
	if !strings.HasSuffix(fileName, ".tpl") {
		fmt.Println("No template file given: .tpl extension missing!")
	}
	text := readFile(fileName)
	m := createMap()
	renderTemplateToFile(m, text, strings.TrimSuffix(fileName, ".tpl"))
}
