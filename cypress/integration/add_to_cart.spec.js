describe('Add to Cart', () => {
  it('should add items to the cart', () => {
    // Visit the home page
    cy.visit('http://localhost:3000');

    // Find the "Add to Cart" button for a product (you may need to adjust this selector)
    cy.get('.products article:first-child').within(() => {
      cy.get('.btn-success').click();
    });

    // Wait for the cart count to update (you may need to adjust this selector)
    cy.get('.navbar .cart-count').should('have.text', '1');
  });
});
