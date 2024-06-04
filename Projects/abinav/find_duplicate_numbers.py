# find_duplicates.py
def find_duplicates(numbers):
    seen = set()
    duplicates = set()
    
    for number in numbers:
        if number in seen:
            duplicates.add(number)
        else:
            seen.add(number)
    
    return list(duplicates)

if __name__ == "__main__":
    import sys
    numbers = list(map(int, sys.argv[1:]))
    duplicates = find_duplicates(numbers)
    print("Duplicate numbers:", duplicates)
