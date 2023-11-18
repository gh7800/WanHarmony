@Entry
@Component
struct LoginPage {
  @State message: string = 'Login'
  private  username: string = ''
  private  password: string = ''

  build() {
    Row() {
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
            console.error(this.username)
          })

        TextInput({ placeholder: '请输入密码' })
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

            }
          })

        Button($r('app.string.Submit'), { stateEffect: true, type: ButtonType.Capsule }) //默认胶囊类型
          .width('85%')
          .margin({ top: 20 })
          .onClick(() => {
            console.error(this.password)
          })
      }
      .width('100%')
      //.height('100%')
      //.justifyContent(FlexAlign.Start)


    }
    .height('100%')
  }
}