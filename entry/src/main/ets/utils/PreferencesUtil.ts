import Preferences from '@ohos.data.preferences'
import constantUtil from './ConstantUtil'

/**
 * K-V 首选项
 */

class PreferenceUtil {
  private preferencesName: string = "HYLD_OA"
  preferenceInstance: Preferences.Preferences = null

  getPreferences(context: any) {
    var promise = Preferences.getPreferences(context, this.preferencesName)
    promise.then((object) => {
      this.preferenceInstance = object
    }).catch((err) => {
      console.error('实例获取失败__err', err)
    })
  }

  save(key: string, value: string) {
    if(!this.preferenceInstance){
      throw new Error('preferenceInstance__'+this.preferenceInstance)
      return
    }
    this.preferenceInstance.put(key, value, (err) => {
      if (err) {
        console.error('保存失败_err', err)
      } else {
        console.error('保存成功')
      }
    })

    this.preferenceInstance.flush()//数据量大时使用，避免保存失败
  }

  async getString(key: string,def : string = ''){
      return this.preferenceInstance.get(key, def)
  }

  async getNumber(key: string,def : number = 0) {
    return this.preferenceInstance.get(key, def)
  }

  async getBoolean(key : string,bl : boolean = false){
    return this.preferenceInstance.get(key,bl)
  }

  //删除key
  async deleteKey(key : string){
    return this.preferenceInstance.delete(key)
  }

  //清空所有
  async clear(){
    return this.preferenceInstance.clear()
  }
}

const preferenceUtil = new PreferenceUtil()
export default preferenceUtil