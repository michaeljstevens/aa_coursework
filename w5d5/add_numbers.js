const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addNumber (sum, numsLeft, completionCallBack) {
  if (numsLeft > 0) {
    reader.question("Give me a number", (input) => {
      let parsed = parseInt(input);
      sum += parsed;
      numsLeft -= 1;
      console.log(sum);
      addNumber(sum, numsLeft, completionCallBack);
    });
  } else if (numsLeft === 0) {
    completionCallBack(sum);
    reader.close();
  }
}


addNumber(0, 3, sum => console.log(`Total Sum: ${sum}`));

// function addTwoNums(n1 = 5, n2 = 10) {
//
// }
