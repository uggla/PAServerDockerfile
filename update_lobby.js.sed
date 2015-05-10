# Insert function
/^var getAIName/ i setInterval(function() {
/^var getAIName/ i if (server.beacon) {
/^var getAIName/ i console.log("<BACON>"+JSON.stringify(server.beacon)+"</BACON>");
/^var getAIName/ i }
/^var getAIName/ i }, 5000);
/^var getAIName/ i \

# Update parameters
s/var MAX_PLAYERS = [0-9]\+/var MAX_PLAYERS = 16/
s/var MAX_SPECTATORS = [0-9]\+/var MAX_SPECTATORS = 5/
