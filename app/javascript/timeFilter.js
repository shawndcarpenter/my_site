document.addEventListener('turbo:load', function() {
  let isBrightnessApplied = false;
  let toggleButton = document.getElementById('toggleBrightness');

  function adjustBrightness() {
    let date = new Date();
    let hour = date.getHours();
    let brightnessLevel;
    if (hour < 12 && hour > 3) {
      brightnessLevel = (0.1 * (hour - 2)).toFixed(1);
    } else if (hour > 12 && hour < 21) {
      brightnessLevel = (0.1 * (22 - hour)).toFixed(1);
    } else {
      brightnessLevel = 0.1;
    }

    document.querySelector(".background-pages").style.filter = `brightness(${brightnessLevel})`;
    document.querySelector(".background-pages").style.webkitFilter = `brightness(${brightnessLevel})`;
    document.getElementById("hour").textContent = "Time-based theme selected: " + date.toLocaleTimeString();
  }

  function removeBrightness() {
    document.querySelector(".background-pages").style.filter = '';
    document.querySelector(".background-pages").style.webkitFilter = '';
    document.getElementById("hour").textContent = "Brightness filter removed";
  }

  toggleButton.addEventListener('click', function() {
    if (isBrightnessApplied) {
      removeBrightness();
      toggleButton.textContent = "Apply Brightness Filter";
    } else {
      adjustBrightness();
      toggleButton.textContent = "Remove Brightness Filter";
    }
    isBrightnessApplied = !isBrightnessApplied;
  });
});