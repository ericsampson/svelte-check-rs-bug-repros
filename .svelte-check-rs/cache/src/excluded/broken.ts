// This file has intentional TypeScript errors
// It should be excluded from type checking via tsconfig.json "exclude"

const x: string = 123; // Type error: number not assignable to string
const y: number = "hello"; // Type error: string not assignable to number

export function broken(): void {
  return "not void"; // Type error: string not assignable to void
}
