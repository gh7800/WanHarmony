import promptAction from '@ohos.promptAction'

class ToastUtil {
  show(msg: any) {
    promptAction.showToast({ message: msg + '' })
  }
}

const toastUtil = new ToastUtil()

export default toastUtil