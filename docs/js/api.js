class API {
	constructor(url) {
		this.url = new URL(url)
	}
	getCode() {
		return this.url.searchParams.get("code")
	}
}
var api;
document.addEventListener("DOMContentLoaded", e => {
	api = new API(window.location)
})
