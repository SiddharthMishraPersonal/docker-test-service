var express = require('express');
var fs = require('fs');
var app = express();
app.get('/', function (req, res) {
  try {
    console.log(`Root has been called by IP:'${req.ip}'`);
    const message = process.env['MESSAGE'];
    const env = process.env['ENV'];
    const fileContent = readFile();
    res.send(`<h1>Hello Guys,</h1> <h2> How are you!!!</h2><p>ENV: ${env} </p><p> MESSAGE: '${message}'</p><p>File Content: ${fileContent}</p>`);
  } catch (error) {
    res.send(`<h1>Error Occurred</h1><p>${error}</p>`);
  }
});

const readFile = function () {
  const fileContent = fs.readFileSync('/demo/test.txt', 'utf8');
  console.log(fileContent);
  return fileContent;
}

app.listen(3000);