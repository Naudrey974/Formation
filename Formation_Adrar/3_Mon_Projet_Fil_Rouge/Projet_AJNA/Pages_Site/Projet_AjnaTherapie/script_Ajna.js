
/*Ouverture et fermeture du menu burger*/
let sidenav = document.getElementById("mySidenav");
let openBtn = document.getElementById("openBtn");
let closeBtn = document.getElementById("closeBtn");

openBtn.onclick = openNav;
closeBtn.onclick = closeNav;

/* Ouvrir la navigation latérale sur 200px */
function openNav() {
  sidenav.classList.toggle("active");
}

/* Fermer la navigation latérale en la passant à 0px */
/* function closeNav() {
  sidenav.classList.remove("active");
} 
 */