import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const bookingForm = document.getElementById("new_booking");
  if (bookingForm) {
    flatpickr(".datepicker", {});
    const startDate = document.getElementById("booking_start_date");
    const endDate = document.getElementById("booking_end_date");
    const totalNights = document.getElementById("total-nights");
    const flatPricePerNight = document.getElementById("flat-price-per-night").innerText;
    const totalPriceElement = document.getElementById("total-price");

    const dynamicPrice = () => {
      let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
      let nbrOfNights = dateDiffInMilliseconds / 86400000;
      if (startDate.value && endDate.value) {
        totalNights.innerText = nbrOfNights
        totalPriceElement.innerText = nbrOfNights * flatPricePerNight
      }
    };

    [startDate, endDate].forEach(date => {
      date.addEventListener("change", (event) => {
        dynamicPrice();
      });
    })
  }
}

export { initFlatpickr };



// const dynamicPriceCalculator = () => {
  // [...]
  // je n'affiche le nombre de nuit que si les deux dates sont sélectionnées
