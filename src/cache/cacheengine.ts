// src/cache/cacheengine.ts
export class CacheEngine {
  private store: Map<string, unknown> = new Map();

  get(key: string) {
    return this.store.get(key);
  }

  set(key: string, value: unknown) {
    this.store.set(key, value);
  }

  delete(key: string) {
    this.store.delete(key);
  }

  clear() {
    this.store.clear();
  }
}
