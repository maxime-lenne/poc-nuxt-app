module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
    "cypress/globals": true
  },
  parserOptions: {
    parser: 'babel-eslint'
  },
  extends: [
    '@nuxtjs',
    "airbnb-base",
    "eslint:recommended",
    // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
    // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
    "plugin:vue/recommended",
    "plugin:prettier/recommended",
    "plugin:cypress/recommended"
  ],
  plugins: [
    'vue',
    "cypress"
  ],
  // add your custom rules here
  rules: {
    "semi": [2, "never"],
    "no-console": "off",
    "vue/max-attributes-per-line": "off",
    "prettier/prettier": ["error", { "semi": false }],
    "quotes": "off",
    "comma-dangle": "off",
    "import/no-extraneous-dependencies": ["warn"]
  }
}
