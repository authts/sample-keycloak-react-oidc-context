module.exports = {
  $schema: 'http://json.schemastore.org/prettierrc',
  printWidth: 120,
  tabWidth: 2,
  useTabs: false,
  singleQuote: true,
  trailingComma: 'none',
  endOfLine: 'auto',
  arrowParens: 'always',
  bracketSpacing: true,
  htmlWhitespaceSensitivity: 'css',
  insertPragma: false,
  jsxSingleQuote: false,
  proseWrap: 'preserve',
  quoteProps: 'as-needed',
  requirePragma: false,
  semi: true,
  overrides: [
    {
      files: '*.svg',
      options: {
        parser: 'html'
      }
    }
  ]
};
