#!/bin/bash

TODO_FILE="$HOME/todo.txt"

function show_menu {
    dialog --menu "To-Do List" 15 50 4 \
        1 "Add a task" \
        2 "List tasks" \
        3 "Mark task as done" \
        4 "Exit" 2>menu_choice.txt

    case $(cat menu_choice.txt) in
        1) add_task ;;
        2) list_tasks ;;
        3) mark_task_done ;;
        4) exit 0 ;;
    esac
}

function add_task {
    dialog --inputbox "Enter your task:" 8 40 2>task.txt
    echo "$(cat task.txt)" >> "$TODO_FILE"
    dialog --msgbox "Task added!" 6 20
    show_menu
}

function list_tasks {
    if [ ! -s "$TODO_FILE" ]; then
        dialog --msgbox "No tasks in your to-do list!" 6 40
    else
        dialog --textbox "$TODO_FILE" 20 50
    fi
    show_menu
}

function mark_task_done {
    TASKS=$(nl -w 2 -s '. ' "$TODO_FILE")
    dialog --menu "Select task to mark as done:" 20 50 10 $(echo "$TASKS" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//') 2>task_num.txt
    if [ -s task_num.txt ]; then
        sed -i "$(cat task_num.txt)s/^/[DONE] /" "$TODO_FILE"
        dialog --msgbox "Task marked as done!" 6 20
    fi
    show_menu
}

show_menu
