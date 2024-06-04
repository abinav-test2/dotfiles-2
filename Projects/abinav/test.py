# To-Do List in Python CLI

# Function to display the to-do list
def show_list(todo_list):
    if todo_list:
        for index, item in enumerate(todo_list, start=1):
            print(f"{index}. {item}")
    else:
        print("Your to-do list is empty.")

# Main function
def main():
    todo_list = []
    while True:
        print("\n1. Add to the to-do list")
        print("2. View the to-do list")
        print("3. Exit")
        choice = input("Enter your choice: ")
        if choice == "1":
            task = input("Enter the task to add: ")
            todo_list.append(task)
            print("Task added to the to-do list.")
        elif choice == "2":
            show_list(todo_list)
        elif choice == "3":
            print("Exiting the to-do list.")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()

