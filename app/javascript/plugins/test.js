const getPrice = () => {
  const start = document.getElementById('booking_start_date').value;
  const end = document.getElementById('booking_end_date').value;
  const one = new Date(start)
  const last = new Date(end)
  const period = (last - one)/1000/60/60/24
  let price = document.querySelector("#richard").innerText
  price = parseInt(price,10)
  const total = period * price
  const total_price = document.getElementById('total_price');
  total_price.innerHTML= total

};

const end = document.getElementById('new_booking');
end.addEventListener("change",getPrice)
