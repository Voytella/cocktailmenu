// tool for reading files
const fs = require('fs');

// grab the chosen cocktail from the command line
let cocktail = document.currentScript.getAttribute('cocktail');
console.log(cocktail)
// extract the cocktail's data
let data = JSON.parse(fs.readFileSync('Recipies/' + cocktail + '/data.json'));

document.getElementById("data").innerHTML = data.name;
