const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const tasks = [];

function displayTasks() {
  console.log('--- To-Do List ---');
  tasks.forEach((task, index) => {
    console.log(`${index + 1}. ${task}`);
  });
  console.log('------------------');
}

function addTask(task) {
  tasks.push(task);
  console.log('Task added successfully!');
}

rl.on('line', (input) => {
  const command = input.trim().toLowerCase();

  if (command === 'list') {
    displayTasks();
  } else if (command.startsWith('add ')) {
    const task = input.slice(4).trim();
    addTask(task);
  } else if (command === 'exit') {
    console.log('Exiting...');
    rl.close();
  } else {
    console.log('Invalid command. Please try again.');
  }
});

console.log('Welcome to your To-Do List!');
console.log('Type "add [task]" to add a task, "list" to display tasks, or "exit" to quit.');
