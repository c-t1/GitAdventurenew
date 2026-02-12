document.addEventListener('DOMContentLoaded', function () {
  // 1) Grab DOM elements once the page is loaded
  const boxContainer = document.querySelector('#box-container');
  const newBoxButton = document.querySelector('#new-box-button');
  const colorForm = document.querySelector('#color-form');
  const colorInput = document.querySelector('#color-input');

  // 2) State variables
  let boxColor = null; // current selected color for new and existing boxes
  let boxIdCounter = 0;   // unique ID for each new box

  // 3) Function to create and append a new box
  function addBox() {
    const box = document.createElement('div');
    const currentId = boxIdCounter;

    box.classList.add('box');                    // required class for styling/selection
    box.style.backgroundColor = boxColor;        // use current selected color
    box.dataset.boxId = String(currentId);       // store ID in data attribute
    box.textContent = String(currentId);         // show ID initially

    boxContainer.appendChild(box);               // add to page
    boxIdCounter++;                           // increment for next box
  }

  // 4) Set color and apply to all current boxes on form submit
  colorForm.addEventListener('submit', function (e) {
    e.preventDefault(); // prevent page reload

    const chosenColor = colorInput.value.trim();
    if (!chosenColor) return; // ignore empty input

    boxColor = chosenColor; // store as the current color

    const allBoxes = document.querySelectorAll('.box');
    for (const box of allBoxes) {
      box.style.backgroundColor = boxColor; // update existing boxes too
    }

    colorInput.value = ''; // clear input after submit
  });

  // 5) Add box when button is clicked
  newBoxButton.addEventListener('click', function () {
    addBox();
  });

  // 6) Remove a box when it is double-clicked (event delegation)
  document.addEventListener('dblclick', function (e) {
    if (e.target.classList.contains('box')) {
      e.target.remove();
    }
  });

  // 7) Show page coordinates when hovering a box
  document.addEventListener('mouseover', function (e) {
    if (e.target.classList.contains('box')) {
      e.target.textContent = `${e.pageX}, ${e.pageY}`;
    }
  });

  // 8) Restore box ID when mouse leaves
  document.addEventListener('mouseout', function (e) {
    if (e.target.classList.contains('box')) {
      e.target.textContent = e.target.dataset.boxId;
    }
  });

  // 9) Add box when N/n key is pressed
  document.addEventListener('keydown', function (e) {
    // Ignore if user is typing inside the color input
    if (e.target === colorInput) return;

    if (e.key === 'n' || e.key === 'N') {
      addBox();
    }
  });
});

