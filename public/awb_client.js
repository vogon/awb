var AWB = (function () {

	var module = {};

	function Client() {
	
		var me = this;
		var _name, _plid;

		var _login = function (name, onLogin) {
			function ajaxDone(data) {
				result = JSON.parse(data);
				_name = name;
				_plid = result.plid;

				onLogin(me);
			}

			$.ajax({
				url: '/login/' + name
			}).done(ajaxDone);
		}

		var _logout = function (onLogout) {
			_plid = undefined;
			onLogout(this);
		}

		var _get_name = function() { return _name; }

		var _get_server_status = function(onDone) {
			function ajaxDone(data) {
				result = JSON.parse(data);
				onDone(result);
			}

			$.ajax({
				url: '/status'
			}).done(ajaxDone);
		}

		var _new_game = function(nPlayers, onDone) {
			function ajaxDone(data) {
				result = JSON.parse(data);
				onDone(result);
			}

			$.ajax({
				url: '/newgame/' + nPlayers
			}).done(ajaxDone);
		}

		this.login = _login;
		this.logout = _logout;

		this.name = _get_name;
		this.getServerStatus = _get_server_status;
		this.newGame = _new_game;
	}

	module.client = new Client();

	return module;
}());