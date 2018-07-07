const P = new ProType();

class MainController extends P.ViewController {
	willShow() {
		this.bg = this.view.querySelector(".bg")
		this.view.querySelector(".year").innerHTML = new Date().getFullYear()
		this.listen()
	}
	listen() {
		window.addEventListener("scroll", this.scroll.bind(this))
	}
	scroll() {
		let pos = window.scrollY;
		if (pos > window.innerHeight / 4) {
			this.bg.style.filter = "none";
			this.bg.style.transform = "scale(1.2)";
		} else if (pos < window.innerHeight / 4) {
			this.bg.style.filter = "saturate(135%) blur(50px)"
			this.bg.style.transform = "scale(1.4)";
		}
	}
}


P.mount([
	"main",
	document.body,
	MainController
])

P.set("main")
