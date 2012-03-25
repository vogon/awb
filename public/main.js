function status_updated(data) {
	result = JSON.parse(data)

	document.getElementById("content").innerHTML += "<!-- /status: " + data + "-->"

}

function update_status() {
	$.ajax({
		url: '/status'
	}).done(status_updated)
}

$(document).ready(update_status)