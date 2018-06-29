class API {
	constructor(url) {
		this.url = new URL(url)

		this.client_id = "5b2f84ea4f87a6af7d185461"
		this.client_secret = "e801eefcf1ff49c27bea9e2587caa238"
	}
	getCode() {
		return this.url.searchParams.get("code")
	}
	request() {
		return new Promise((resolve, reject) => {
			const code = this.getCode()

			const data = new FormData()
			data.append("client_id", this.client_id)
			data.append("client_secret", this.client_secret)
			data.append("redirect_uri", "https://arguiot.github.io/Chirper/api/")
			data.append("code", code)
			data.append("grant_type", "authorization_code")

			fetch("https://api.bufferapp.com/1/oauth2/token.json", {
				method: "POST",
				body: data
			}).then(data => data.json()).then(data => {
				resolve(data)
			})
		});
	}
}
var api;
document.addEventListener("DOMContentLoaded", e => {
	api = new API(window.location)
})
