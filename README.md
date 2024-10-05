# CCU_PD_LaTeX_Template

This repository contains a LaTeX template for the Program Design course at CCU.

## Installation

Simply download `quiz.cls` and place it in the same directory as your `.tex `file. Alternatively, you can place it in the your TEXMF directory.

## Features

* `\quiztitle` generates a title for the quiz section and handles subsequence numbers for multiple subquestions.
* `\hwtitle` generates a title for homework.
* Use `\stepsemester` to increment the semester counter (default is 1).
* Use `\setduedate{date}` to set the due date.
* The document option solution allows you to generate a PDF that includes solution code.
* `\solution[language (default is c)]{filename}` lists the content of filename as solution code (only works when the solution option is active).
* The testcase environment and `\case{input}{output}` command are used to generate sample test cases.

## Requirements

This template uses the minted package for syntax highlighting. Ensure you have pygment installed and run the LaTeX command with the `-shell-escape` option.

## Known Issues

When using the `\case` command, only `\\` works for line breaks in the first argument, and `\newline` must be used for the second argument. (I'm still investigating why this happens.)