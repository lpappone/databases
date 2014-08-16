var mysql = require('mysql');
var mysql = require('mysql');
var serverHelpers = require('./server-helpers');
/* If the node mysql module is not found on your system, you may
 * need to do an "sudo npm install -g mysql". */

/* You'll need to fill the following out with your mysql username and password.
 * database: "chat" specifies that we're using the database called
 * "chat", which we created by running schema.sql.*/
var dbConnection = mysql.createConnection({
  user: "root",
  password: "",
  database: "chat"
});

dbConnection.connect();
/* Now you can make queries to the Mysql database using the
 * dbConnection.query() method.
 * See https://github.com/felixge/node-mysql for more details about
 * using this module.*/


exports.findAllMessages = function(cb){
  var queryString = "select * from messagesTable;";
  var queryArgs = []; //possibly insert string with semicolon

  dbConnection.query(queryString, queryArgs, cb);
  // console.log(select * from messageTable);
  // var result = select * from messageTable // <== returns a mysql object?!?!?!?
  // return (an object of objects?) all messages
};

exports.findUser = function(username, cb){
  var queryString =
  "select userName from usersTable where userName = ?;";
  var queryArgs = [username];

  dbConnection.query(queryString, queryArgs, cb);
};

exports.saveUser = function(username, cb){
  // userid: dynamically generated at usersTable.id
  // username: usersTable.id

  var queryString =
  // "insert into 'usersTable' ('userName') values ('" + username + "');"; // old version
  "insert into usersTable (userName) values (?);";
  var queryArgs = [username];

  dbConnection.query(queryString, queryArgs, cb);
};

exports.saveMessage = function(message, userName, roomname, cb){
  // message: messagesTable.text
  // userid: usersTable.id
  // roomname: messagesTable.room
  // new Time(): messagesTable.time
  var newTime = new Date(); // Time() ???

  var queryString1 = "insert into messagesTable (text,room) values ('" + message + "','" + roomname + "'); "; // if this doesn't work, check for extra quotes
  var queryString2 = "insert into usersTable (id) values ('" + userName + "');";
  var queryStringFinal = queryString1 + queryString2; // concatenate query strings and pass together
  var queryArgs = []; //possibly insert string with semicolon

  dbConnection.query(queryStringFinal, queryArgs, cb); // then pray
};

// exports.saveMessage('You can do this, its basic JavaScript', 'Lauren', 'Floor6', function() {
//   serverHelpers.sendResponse(res, message);
// }); // end exports.saveMessage();


