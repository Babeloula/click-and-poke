const filterType = () => {
  const typeFilter = document.querySelector('.nav-item-index');

  if (typeFilter) {
    typeFilter.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("Hello")
      event.currentTarget.classList.remove('.nav-item-index');
      event.currentTarget.classList.add('.nav-item-selected');
    });
  }
}

export { filterType };
