<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
  margin: 0;
  padding: 0;
}

html {
  font-family: 'Roboto', sans-serif;
  line-height: 1.4;
  font-size: 16px;
}

fieldset {
  padding: 1rem;
  border: none;
}

label {
  display: inline-block;
  padding-right: 0.25rem;
  margin-bottom: 0.5rem;
  text-transform: uppercase;
  letter-spacing: 0.6px;
  text-align: right;
  font-weight: 700;
  font-size: 12px;
  width: 100px;
}

input, select {
  padding: 0.25rem;
  width: 100px;
}

input {
  text-align: center;
  width: 65px;
}

#calendar {
  width: 500px;
  margin: 2rem auto;
}

.labels, .dates {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  text-align: right;
  grid-gap: 4px;
}

.dates span {
  height: 50px;
  font-size: 16px;
  letter-spacing: -1px;
  border: 1px solid #e6e4e4;
  padding-right: 4px;
  font-weight: 700;
}

.labels span {
  font-weight: 300;
  text-align: center;
  margin-bottom: 0.5rem;
  opacity: 0.6;
}

#github {
  font-size: 0;
  color: transparent;
  background: transparent url(https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png) center no-repeat;
  background-size: 100%;
  position: absolute;
  height: 56px;
  width: 56px;
  right: 1rem;
  top: 1rem; 
}
</style>
</head>
<body>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap" rel="stylesheet">
<script src="https://unpkg.com/calendarize"></script>
<script src="https://unpkg.com/sublet"></script>

<fieldset>
 <!-- <div class="input">
    <label for="lang">Language:</label>
    <select id="lang">
      <option value="en" selected>English</option>
      <option value="es">Spanish</option>
    </select>
  </div> --> 

  <div class="input">
    <label for="month">Month:</label>
    <select id="month">
      <option value="0">January</option>
      <option value="1">February</option>
      <option value="2">March</option>
      <option value="3">April</option>
      <option value="4">May</option>
      <option value="5" selected>June</option>
      <option value="6">July</option>
      <option value="7">August</option>
      <option value="8">September</option>
      <option value="9">October</option>
      <option value="10">November</option>
      <option value="11">December</option>
    </select>
    
     <input id="year" type="number" min="1900" max="2100" step="1" value="2019">
  </div>
  
  <div class="input">
    <label for="offset">Week Start:</label>
     <select id="offset">
      <option value="0" selected>Sunday</option>
      <option value="1">Monday</option>
      <option value="2">Tuesday</option>
      <option value="3">Wednesday</option>
      <option value="4">Thursday</option>
      <option value="5">Friday</option>
      <option value="6">Saturday</option>
    </select>
  </div>
 </fieldset>

<div id="calendar">
  <div class="labels"></div>
  <div class="dates"></div>
</div>

<a id="github" href="https://github.com/lukeed/calendarize" target="_blank">GitHub</a>
<script>
const $ = document.querySelector.bind(document);
const h = tag => document.createElement(tag);

const text_labels = {
  en: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
  es: ['DOM', 'LUN', 'MAR', 'MIE', 'JUV', 'VIE', 'SAB'],
};

// -- setup

const labels = $('#calendar .labels');
const dates = $('#calendar .dates');

const lspan = Array.from({ length: 7 }, () => {
  return labels.appendChild(h('span'));
});

const dspan = Array.from({ length: 42 }, () => {
  return dates.appendChild(h('span'));
});

// -- state mgmt
  
const view = sublet({
  lang: 'en',
  offset: 0,
  year: 2019,
  month: 5,
}, update);
  
function update(state) {
  const offset = state.offset;
  
  // apply day labels
  const txts = text_labels[state.lang];
  lspan.forEach((el, idx) => {
    el.textContent = txts[(idx + offset) % 7];
  });
  
  // apply date labels (very naiive way, pt 1)
  let i=0, j=0, date = new Date(state.year, state.month);
  calendarize(date, offset).forEach(week => {
    for (j=0; j < 7; j++) {
      dspan[i++].textContent = week[j] > 0 ? week[j] : '';
    }
  });
  
  // clear remaining (very naiive way, pt 2)
  while (i < dspan.length) dspan[i++].textContent = '';
}

// -- inputs

$('#lang').onchange = ev => {
  view.lang = ev.target.value;
};

$('#offset').onchange = ev => {
  view.offset = +ev.target.value;
};

$('#month').onchange = ev => {
  view.month = ev.target.value;
};

$('#year').onchange = ev => {
  view.year = ev.target.value;
};
</script>
</body>
</html>