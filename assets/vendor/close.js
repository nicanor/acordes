document.addEventListener('click', event => {
  if (event.target.matches('.close-js')) {
    element = getClosestClosable(event.target); //event.target.parentNode;
    element.parentNode.removeChild(element);
  }
})

var getClosestClosable = function (elem) {
  for ( ; elem && elem !== document; elem = elem.parentNode ) {
    if (elem.classList.contains('closable-js')) {
      return elem;
    }
  }
};
