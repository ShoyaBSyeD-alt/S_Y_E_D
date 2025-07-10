package main

import (
    "fmt"
    "net/http"
    "strconv"
    "strings"
)

func main() {
    http.HandleFunc("/calc", calculatorHandler)

    fmt.Println("Calculator server is running on port 8080...")
    http.ListenAndServe(":8080", nil)
}

func calculatorHandler(w http.ResponseWriter, r *http.Request) {
    expr := r.URL.Query().Get("expr")

    if expr == "" {
        http.Error(w, "Missing 'expr' query parameter. Example: /calc?expr=5+2", http.StatusBadRequest)
        return
    }

    expr = strings.ReplaceAll(expr, " ", "")
    var operator string
    var left, right int
    var err error

    // Find operator and split
    if strings.Contains(expr, "+") {
        parts := strings.Split(expr, "+")
        operator = "+"
        left, err = strconv.Atoi(parts[0])
        right, err = strconv.Atoi(parts[1])
    } else if strings.Contains(expr, "-") {
        parts := strings.Split(expr, "-")
        operator = "-"
        left, err = strconv.Atoi(parts[0])
        right, err = strconv.Atoi(parts[1])
    } else if strings.Contains(expr, "*") {
        parts := strings.Split(expr, "*")
        operator = "*"
        left, err = strconv.Atoi(parts[0])
        right, err = strconv.Atoi(parts[1])
    } else if strings.Contains(expr, "/") {
        parts := strings.Split(expr, "/")
        operator = "/"
        left, err = strconv.Atoi(parts[0])
        right, err = strconv.Atoi(parts[1])
    } else {
        http.Error(w, "Invalid operator. Use +, -, *, or /", http.StatusBadRequest)
        return
    }

    if err != nil {
        http.Error(w, "Invalid numbers", http.StatusBadRequest)
        return
    }

    // Do the calculation
    var result int
    switch operator {
    case "+":
        result = left + right
    case "-":
        result = left - right
    case "*":
        result = left * right
    case "/":
        if right == 0 {
            http.Error(w, "Division by zero error", http.StatusBadRequest)
            return
        }
        result = left / right
    }

    fmt.Fprintf(w, "Result: %d\n", result)
}

