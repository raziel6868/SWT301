
const filterBtn = document.getElementById('filterBtn');
const suggestBtn = document.getElementById('suggestBtn');
const filterForm = document.getElementById('filterForm');
const suggestForm = document.getElementById('suggestForm');

filterBtn.addEventListener('click', function () {
    filterForm.classList.remove('hidden');
    suggestForm.classList.add('hidden');
});

suggestBtn.addEventListener('click', function () { 
    filterForm.classList.add('hidden');
    suggestForm.classList.remove('hidden');
});



function toggleSort() {
    var navigation = document.querySelector(".sort-selection");
    navigation.classList.toggle("hidden");
}

function toggleColor() {
    var navigation = document.querySelector(".color-selection");
    navigation.classList.toggle("hidden");
}

function toggleSize() {
    var navigation = document.querySelector(".size-selection");
    navigation.classList.toggle("hidden");
}


var currentDate = new Date();

// Format the date to yyyy-mm-dd
var year = currentDate.getFullYear();
var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
var day = ('0' + currentDate.getDate()).slice(-2);
var formattedDate = year + '-' + month + '-' + day;

function validateDates() {
    var startDate = document.getElementsByName('StartDate')[0].value;
    var endDate = document.getElementsByName('EndDate')[0].value;


    var today = new Date();
    var startDateObj = new Date(startDate);
    var endDateObj = new Date(endDate);


    if (startDateObj < today) {
        alert("Check-in date cannot be in the past.");
        return false;
    }


    if (endDateObj < today) {
        alert("Check-out date cannot be in the past.");
        return false;
    }


    if (startDateObj >= endDateObj) {
        alert("Check-out date must be after the check-in date.");
        return false;
    }

    if (endDateObj < startDateObj) {
        alert("Check-in date must be less the check-in date.");
        return false;
    }

    return true;
}


window.onload = function () {
    var currentDate = new Date();
    var year = currentDate.getFullYear();
    var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
    var day = ('0' + currentDate.getDate()).slice(-2);
    var formattedDate = year + '-' + month + '-' + day;
    document.getElementsByName('BookingDate')[0].value = formattedDate;
};