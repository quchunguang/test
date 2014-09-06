var count = require('./count/count.js')

function hello() {
    console.log('Hello World!');
    console.log(count.count_int())
    console.log(count.count_int())
    console.log(count.count_int())
    console.log(count.count_string())
    console.log(count.count_string())
    console.log(count.count_string())
}
hello();
