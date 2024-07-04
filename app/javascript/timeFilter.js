document.addEventListener('DOMContentLoaded', function() {
  let hourElement = document.getElementById('hour');
  hourElement.addEventListener('click', function() {
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

    document.getElementById("hour").textContent = "Time-based theme selected: " + date.toLocaleTimeString();
    document.querySelector(".background-pages").style.filter = `brightness(${brightnessLevel})`;
    document.querySelector(".background-pages").style.webkitFilter = `brightness(${brightnessLevel})`;
    });
  });