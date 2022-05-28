window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', function(){
    const priceInputValue = priceInput.value
    const Tax = 0.1;
    const tax_fee = priceInputValue * Tax;
    const profit = priceInputValue - tax_fee;
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = Math.floor(tax_fee);
    profitArea.innerHTML = Math.floor(profit);
  });
})