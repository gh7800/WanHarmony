import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { TitleBarComponent } from '../view/TitleBarComponent'
import api from '../http/Api'
import UserModel from '../model/UserModel'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Login'
  private username: string = ''
  private password: string = ''

  build() {
    Column() {
      TitleBarComponent({ title: '' })
      Column() {
        Text(this.message)
          .fontColor(Color.Orange)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        TextInput({ placeholder: '请输入账号',text:'18500555160' })
          .width('85%')
          .height(50)
          .type(InputType.Normal)
          .maxLength(11)
          .enterKeyType(EnterKeyType.Next)
          .onChange((value: string) => {
            this.username = value
          })

        TextInput({ placeholder: '请输入密码',text:'654321' })
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
    if (this.username.trim()) {

    } else {
      promptAction.showToast({ message: '账号不能为空' })
      return
    }

    if (this.password.trim()) {

    } else {
      promptAction.showToast({ message: '密码不能为空' })
      return
    }

    const params = {
      username : this.username,
      password : this.password
    }

    console.log("params",params.username +'__'+ params.password)

    api.post<UserModel>("/user/login",params)
      .then(response => {
        console.log('___',response.name)
      })
      .catch(error => {
        console.error(error)
      })

    /*router.pushUrl({ url: 'pages/MainPage' }, router.RouterMode.Single, (err) => {
      console.error(err.message)
    })*/
  }
}