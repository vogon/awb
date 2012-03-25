function displayLoggedIn(client) {
	logged_in.innerText = "you're logged in as " + client.name();

	logged_in.style.display = "inline-block";
	logged_out.style.display = "none";
}

function displayLoggedOut() {
	logged_in.style.display = "none";
	logged_out.style.display = "inline-block";
}

function displayActiveGames(serverStatus) {
	// empty out the game list
	game_list = $("#active_games > ul").empty()[0];
	$("#active_games > .n")[0].innerText = serverStatus.n_games

	// then add in items for each game.
	for (var gmid in serverStatus.games) {
		game_list.innerHTML += "<li>" + serverStatus.games[gmid] + "<form><input type=\"submit\" value=\"join\"></form></li>";
	}

	active_games.hidden = false;
}

function refreshActiveGames() {
	AWB.client.getServerStatus(displayActiveGames);
}

function loginFinished(client) {
	refreshActiveGames();
	displayLoggedIn(client);
}

function loginFormSubmit() {
	var username = $("#username")[0].value;
	AWB.client.login(username, loginFinished);

	return false; // suppress form action
}

function startNewGame(nPlayers) {
	AWB.client.newGame(nPlayers, refreshActiveGames);
}

function onReady() {
	//AWB.client.login("Jeff Goldblum", loggedIn);
	displayLoggedOut();
}

$(document).ready(onReady)