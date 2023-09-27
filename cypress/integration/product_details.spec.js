describe('Product Details Page', () => {
  beforeEach(() => {
    // Visit the home page 
    cy.visit('http://localhost:3000');
  });

  it('should navigate to product detail page', () => {
    // Find and click on the first product card
    cy.get('.products article a').first().click();

    cy.url().should('include', '/products/'); // Verify the URL
  });
});
