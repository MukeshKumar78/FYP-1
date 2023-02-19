module.exports = {
  extends: 'next',
  settings: {
    next: {
      rootDir: 'apps/next/',
    },
  },
  root: true,
  rules: {
    "jsx-a11y/alt-text": "off",
    "react/display-name": "off",
    "import/no-anonymous-default-export": "off"
  }
}
