# find_duplicates_gui.py
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput

def find_duplicates(numbers):
    seen = set()
    duplicates = set()
    
    for number in numbers:
        if number in seen:
            duplicates.add(number)
        else:
            seen.add(number)
    
    return list(duplicates)

class FindDuplicatesApp(App):
    def build(self):
        self.box = BoxLayout(orientation='vertical')
        
        self.input = TextInput(hint_text='Enter numbers separated by space')
        self.box.add_widget(self.input)
        
        self.result = Label(text='')
        self.box.add_widget(self.result)
        
        self.button = Button(text='Find Duplicates')
        self.button.bind(on_press=self.find_duplicates)
        self.box.add_widget(self.button)
        
        return self.box
    
    def find_duplicates(self, instance):
        numbers = list(map(int, self.input.text.split()))
        duplicates = find_duplicates(numbers)
        self.result.text = f"Duplicate numbers: {duplicates}"

if __name__ == "__main__":
    FindDuplicatesApp().run()
