// generate bun test
import { test, expect } from 'bun:test';
import { sum } from './index';
test('test', () => {
	expect(sum(1, 2)).toBe(3);
})