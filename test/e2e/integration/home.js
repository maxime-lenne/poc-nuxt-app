/* eslint-disable */
describe("home tests", () => {
  it("Visits index page", () => {
    cy.visit("/")
    cy.get("nav", { timeout: 1000 })
    cy.get("aside").should("not.be.visible")
    cy.get("nav button", { timeout: 1000 }).click()
    cy.get("aside").should("be.visible")
    cy.get("aside").contains("Categories")
    //cy.contains('h1', 'Nuxt.js + Cypress');
  })

  it("Go to categories page", () => {
    cy.get("a").contains("Categories").click()
    cy.contains("h2", "Categories")
    cy.url().should('include', '/categories')
  })
})
