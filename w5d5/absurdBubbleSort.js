const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});



function absurdBubbleSort(arr, sortCompletionCallback) {
  outerBubbleSortLoop(true);
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
      reader.close();
    }
  }

}


function askIfGreaterThan(el1, el2, callback) {

  reader.question(`Is ${el1} > ${el2}?`, (input) => {
    //do stuff.
      if (input === "yes") {
        callback(true);
      } else {
        callback(false);
      }
  });
}

// askIfGreaterThan(5,3, (value) => {
//   if (value === true) {
//     console.log("stuff");
//   } else {
//     console.log("idk");
//   }
// });

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

  if (i < arr.length-1) {
    askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) => {
      if (isGreaterThan) {
        let temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
        console.log(arr);
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
      }
      else {
        console.log(arr);
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
      }
    });
  } else {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

let array = [4,1,5,3,7];
absurdBubbleSort(array, ()=> {
  console.log("congrats");
  console.log(array);
});
