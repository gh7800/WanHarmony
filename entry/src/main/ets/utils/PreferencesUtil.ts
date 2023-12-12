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
      console.error('获取成功')
      /*object.put(constantUtil.REAL_NAME, 'anxu').then((data) => {
        console.error('____' + this.preferenceInstance + '___' + data)
      }).catch((err) => {
        console.error(err)
      })
      */
    }).catch((err) => {
      console.error('err', err)
    })


  }

  save(key: string, value: string) {
    this.preferenceInstance.put(key, value, (err, data) => {
      if (err) {
        console.error('save_err', err)
      } else {
        console.error('保存成功')
      }
    })
  }

  getString(key: string): string {
     if(null == this.preferenceInstance){
       return 'NULL'
     }

    this.preferenceInstance.get(key, '', (err, data) => {
      if (err) {
        console.error('111_' + err)
        return err
      } else {
        console.error('222_' + data)
        return data
      }
    })

  }

  getNumber(key: string): number {
    this.preferenceInstance.get(key, 0, (err, data) => {
      if (err) {
        return 0
      } else {
        return data
      }
    })
    return 0
  }
}

const preferenceUtil = new PreferenceUtil()

export default preferenceUtil