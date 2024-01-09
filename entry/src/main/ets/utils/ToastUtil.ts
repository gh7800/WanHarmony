import promptAction from '@ohos.promptAction'

class ToastUtil {
  show(msg: any,duration : number = 1500) {
    promptAction.showToast({ message: msg + '' ,duration})
  }
}

const toastUtil = new ToastUtil()

export default toastUtil