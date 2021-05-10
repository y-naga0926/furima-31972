window.addEventListener('load',function ()  {
  
const priceInput = document.getElementById("item-price");
if (!priceInput){ return false;}
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  
const taxInput = document.getElementById("add-tax-price");
taxInput.innerHTML = Math.floor(inputValue * 0.1);

const profitInput = document.getElementById("profit");
const value_result = inputValue * 0.1
     profitInput.innerHTML = (Math.floor(inputValue - value_result));
})
})

