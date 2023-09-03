document.addEventListener("DOMContentLoaded", function() {
  const heartIcons = document.querySelectorAll('.heart-icon');
  heartIcons.forEach(icon => {
    icon.addEventListener('click', function() {
      if (!userIsLoggedIn) { // Implemente a lógica para verificar o login
        // Mostre o modal de login
        // Código para mostrar o modal
      }
    });
  });
});
