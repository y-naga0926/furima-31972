window.addEventListener('load',function ()  {
  
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  
const taxInput = document.getElementById("add-tax-price");
taxInput.innerHTML = Math.floor(inputValue * 0.1);
console.log(taxInput);

const profitInput = document.getElementById("profit");
const value_result = inputValue * 0.1
     profitInput.innerHTML = (Math.floor(inputValue - value_result));
     console.log(profitInput);
})
})

