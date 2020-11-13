window.onload = function() {
	let dropdown = document.getElementsByClassName('dropdown');
	let menu = document.getElementsByClassName('menu');
	let menu_icons = document.getElementsByClassName('menu_icon');
	let subs = document.getElementsByClassName('sub');
	
	for(let i = 1; i < menu.length-1; i++) {
		menu[i].addEventListener('mouseenter', function(e) {
			dropdown[i-1].style.display = 'block';
		}, false);

		menu[i].addEventListener('mouseleave', function(e) {
			dropdown[i-1].style.display = 'none';
		}, false);

		dropdown[i-1].addEventListener("mouseenter", function(e) {
			this.style.display = 'block';
		}, false);

		dropdown[i-1].addEventListener("mouseleave", function(e) {
			this.style.display = 'none';
		}, false);
	}
}