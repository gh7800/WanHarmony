import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { TitleBarComponent } from '../view/TitleBarComponent'
import api from '../http/Api'
import UserModel from '../model/UserModel'
import { AppResponse } from '@system.app'
import ApiResponse from '../http/ApiRsponse'
import SystemModel from '../model/SystemModel'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Login'
  private username: string = 'bjwangs'
  private password: number = 1223456

  build() {
    Column() {
      TitleBarComponent({ title: '' })
      Column() {
        Text(this.message)
          .fontColor(Color.Orange)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        TextInput({ placeholder: '请输入账号', text: '' })
          .width('85%')
          .height(50)
          .type(InputType.Normal)
          .maxLength(11)
          .enterKeyType(EnterKeyType.Next)
          .onChange((value: string) => {
            this.username = value
          })

        TextInput({ placeholder: '请输入密码', text: '' })
          .width('85%')
          .height(50)
          .margin({ top: 10 })
          .type(InputType.Password)
          .maxLength(16)
          .enterKeyType(EnterKeyType.Go)
          .onChange((value: string) => {
            //this.password = value
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

    if (this.password) {

    } else {
      promptAction.showToast({ message: '密码不能为空' })
      return
    }

    const params = {
      username: this.username,
      password: this.password
    }

    api.post('/user/login', params)
      .then((response : ApiResponse<UserModel>) => {
        console.log('result__',response.errorMsg)
      })
      .catch(error => {
        promptAction.showToast(error)
        console.error(error)
      })

    /*api.get<ApiResponse<Array<SystemModel>>>("/tree/json")
      .then((response : ApiResponse<Array<SystemModel>>)=> {
        console.log('result___',response.data[0].name)
      })
      .catch(error => {
        console.error(error)
      })*/

    /*router.pushUrl({ url: 'pages/MainPage' }, router.RouterMode.Single, (err) => {
      console.error(err.message)
    })*/
  }
}