import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { TitleBarComponent } from '../view/TitleBarComponent'
import api from '../http/Api'
import UserModel from '../model/UserModel'
import ApiResponse from '../http/ApiRsponse'
import LoadingDialog from '../view/LoadingDialog'
import userManager from '../manager/UserManager'
import preferenceUtil from '../utils/PreferencesUtil'
import logUtil from '../utils/LogUtil'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Login'
  private username: string = null
  private password: string = null
  dialogController = new CustomDialogController({
    builder: LoadingDialog(),
    customStyle: true,
    cancel: () => {
      promptAction.showToast({ message: '已取消登录' })
    }
  })

  aboutToAppear(){
    //preferenceUtil.getPreferences(getContext())
  }

  build() {
    Column() {
      TitleBarComponent({ title: '', bgColor: $r('app.color.ff') })

      Column() {
        Text(this.message)
          .fontColor(Color.Orange)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        TextInput({ placeholder: '请输入账号' })
          .width('85%')
          .height(50)
          .type(InputType.Normal)
          .maxLength(11)
          .enterKeyType(EnterKeyType.Next)
          .onChange((value: string) => {
            this.username = value
          })

        TextInput({ placeholder: '请输入密码'})
          .width('85%')
          .height(50)
          .margin({ top: 10 })
          .type(InputType.Password)
          .maxLength(16)
          .enterKeyType(EnterKeyType.Go)
          .onChange((value: string) => {
            this.password = value
          })
          .onSubmit((keyType: EnterKeyType) => {
            if (keyType == EnterKeyType.Done) {
              this.login()
            }
          })

        Button($r('app.string.Submit'), { stateEffect: true, type: ButtonType.Capsule }) //默认胶囊类型
          .width('85%')
          .margin({ top: 20 })
          .onClick(() => {
            this.login()
          })
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

    }
    .height("100%")

  }

  /**login*/
  private login() {
    if (!this.username) {
      promptAction.showToast({ message: '账号不能为空' })
      return
    }

    if (!this.password) {
      promptAction.showToast({ message: '密码不能为空' })
      return
    }

    const params = {
      username: this.username,
      password: this.password
    }

    this.dialogController.open()

    api.post('/auth/login', params)
      .then((response: ApiResponse<UserModel>) => {
        promptAction.showToast({ message: '登录成功' })

        userManager.saveUser(response.data)

        setTimeout(() => {
          this.dialogController.close()

          router.replaceUrl({ url: 'pages/MainPage' }, router.RouterMode.Single, (err) => {
            console.error(err.message)
          })
        }, 1000)

      })
      .catch(error => {
        this.dialogController.close()
        promptAction.showToast(error)
      })

  }
}