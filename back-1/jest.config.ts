export default {
  collectCoverage: true,
  collectCoverageFrom: ['./src/**/*.ts'],
  coveragePathIgnorePatterns: ['src/development.ts'],
  coverageThreshold: {
    global: {
      branches: 100,
      functions: 100,
      lines: 100,
      statements: 100
    }
  },

  preset: 'ts-jest',
  testEnvironment: 'node',
  moduleFileExtensions: ['ts', 'js', 'json', 'node'],
  testMatch: ['<rootDir>/src/**/*.test.ts']
};
