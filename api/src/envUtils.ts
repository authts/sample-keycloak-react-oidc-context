export const requireEnvVar = (name: string): string => {
  const value = process.env[name];
  if (!value) {
    throw new Error(`Env var ${name} is required`);
  }
  return value;
};
