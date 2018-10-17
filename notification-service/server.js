'use strict';

const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);
const bodyParser = require('body-parser');

let prevVotes = {};

app.use(bodyParser.json());
app.post('/notify', (req, res) => {
  res.send('Got it: ' + JSON.stringify(req.body));

  io.emit('update', req.body, { for: 'everyone' });
  prevVotes = req.body;
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});

io.on('connection', (socket) => {
  console.log('a user connected');
  socket.emit('update', prevVotes);
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });
});
