/**
 * 全局的
 */

export class AppGlobalContext {
  constructor() {
  }

  private static instance: AppGlobalContext;
  private _map = new Map<string, any>();

  public static getContext(): AppGlobalContext {
    if (!AppGlobalContext.instance) {
      AppGlobalContext.instance = new AppGlobalContext();
    }
    return AppGlobalContext.instance;
  }

  getValue(value: string): any {
    let result = this._map.get(value);
    return result;
  }

  setValue(key: string, value: any): void {
    this._map.set(key, value);
  }

  hasKey(key: string) {
    return this._map.has(key)
  }

  deleteKey(key: string) {
    return this._map.delete(key)
  }

  clear() {
    //this._map.clear()
    for(const key of this._map){
      this._map.delete(key.toString())
    }
  }
}