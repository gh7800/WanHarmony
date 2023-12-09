import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { TitleBarComponent } from '../view/TitleBarComponent'
import api from '../http/Api'
import UserModel from '../model/UserModel'
import ApiResponse from '../http/ApiRsponse'
import LoadingDialog from '../view/LoadingDialog'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Login'
  private username: string = ''
  private password: string = ''
  @State isLoading: boolean = false
  dialogController = new CustomDialogController({
    builder: LoadingDialog(),
    customStyle : true,
    cancel: () => {
      promptAction.showToast({ message: '已取消登录' })
    }
  })

  build() {
    Column() {
      TitleBarComponent({ title: '', bgColor: $r('app.color.ff') })

      Column() {
        Text(this.message)
          .fontColor(Color.Orange)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        TextInput({ placeholder: '请输入账号', text: '0002005' })
          .width('85%')
          .height(50)
          .type(InputType.Normal)
          .maxLength(11)
          .enterKeyType(EnterKeyType.Next)
          .onChange((value: string) => {
            this.username = value
          })

        TextInput({ placeholder: '请输入密码', text: '0002005' })
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

      /*if (this.isLoading) {
        LoadingDialog()
      }*/

    }
    .height("100%")

  }

  /**login*/
  private login() {
    if (this.username.trim()) {

    } else {
      promptAction.showToast({ message: '账号不能为空' })
      return
    }

    if (this.password) {

    } else {
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
        var user = response.data

        setTimeout(() => {
          this.dialogController.close()

          router.pushUrl({ url: 'pages/MainPage' }, router.RouterMode.Single, (err) => {
            console.error(err.message)
          })
        }, 1000)

      })
      .catch(error => {
        promptAction.showToast(error)
        console.error(error)
        this.isLoading = false
      })

    /*const params1 = {
      author: '鸿洋'
    }
    var page = 0
    api.get("/article/list/"+ page + "/json", params1)
      .then((response: ApiResponse) => {
        console.log('result___', JSON.stringify(response.data))
      })
      .catch(error => {
        console.error(error)
      })*/


  }
}