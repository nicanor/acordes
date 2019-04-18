unaccented = function(text) {
  return text.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
}

filter_unaccented = function (text, input) {
  return RegExp(input, "i").test(unaccented(text));
};

function initialize_searchbox(input) {
  var awesomplete = new Awesomplete(input, {
    replace: function(text) { this.input.value = text; },
    filter: filter_unaccented,
    data: function (text, input) {
      return unaccented(text);
    },
    minChars: 3,
    autoFirst: true
  });

  input.addEventListener("awesomplete-select", function(event) {
    input.text = event.text.label;
    window.location.href = "/artistas/" + event.text.value;
  });

  input.addEventListener("keyup", function(event) {
    if (input.value.length < 3) {return;}
    var code = (event.keyCode || event.which);

    if (code === 37 || code === 38 || code === 39 || code === 40 || code === 27 || code === 13) {return;}
    var ajax = new XMLHttpRequest();

    ajax.open("GET", "/api/suggestions?input=" + input.value, true);
    ajax.onload = function() { awesomplete.list = JSON.parse(ajax.responseText).suggestions; };
    ajax.send();
  });

}
