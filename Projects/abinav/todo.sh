#!/bin/bash

TODO_FILE="$HOME/todo.txt"

function show_help {
    echo "Usage: $0 [add|list|done] [task_number]"
    echo "Commands:"
    echo "  add <task>   Add a new task"
    echo "  list         List all tasks"
    echo "  done <num>   Mark task number <num> as done"
}

function add_task {
    echo "$1" >> "$TODO_FILE"
    echo "Added task: $1"
}

function list_tasks {
    if [ ! -s "$TODO_FILE" ]; then
        echo "No tasks in your to-do list!"
        return
    fi
    nl -w 2 -s '. ' "$TODO_FILE"
}

function mark_done {
    sed -i "${1}s/^/[DONE] /" "$TODO_FILE"
    echo "Marked task $1 as done."
}

case "$1" in
    add)
        shift
        add_task "$*"
        ;;
    list)
        list_tasks
        ;;
    done)
        mark_done "$2"
        ;;
    *)
        show_help
        ;;
esac
