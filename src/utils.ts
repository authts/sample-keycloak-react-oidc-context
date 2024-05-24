export const sleep = async (millis: number): Promise<void> => {
  await new Promise((resolve) => {
    setTimeout(resolve, millis);
  });
};
