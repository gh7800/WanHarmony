/**
 * 系统/全局的一些函数
 */
class SystemUtil {

  // 打开指定应用的详情页面 'com.example.myapplication'
  openSystemSettings(context: any, bundleName: string) {
    let wantInfo = {
      action: 'action.settings.app.info',
      parameters: {
        settingsParamBundleName: bundleName
      }
    }
    context.startAbility(wantInfo).then(() => {
      // ...
    }).catch((err) => {
      // ...
    })
  }
}

const systemUtil = new SystemUtil()
export default systemUtil