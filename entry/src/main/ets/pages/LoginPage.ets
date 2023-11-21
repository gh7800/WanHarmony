import router from '@ohos.router'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Login'
  private username: string = ''
  private password: string = ''

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

            AlertDialog.show({
              title: 'Login',
              message: '确定登录吗?',
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -30 }, //偏移量
              autoCancel: true,
              /*confirm:{  //只有一个button的警告
                value:'确定',
                action:()=>{
                  router.pushUrl({url:'/pages/MainPage'},router.RouterMode.Single,(message)=>{

                  })
                }
              },
              cancel:()=>{
                console.error("cancel")
              }
              */
              secondaryButton: {
                value: '取消',
                action: () => {
                  console.error("cancel")
                }
              },
              primaryButton: {
                value: '确定',
                action: () => {
                  router.pushUrl({url:'pages/MainPage' }, router.RouterMode.Single, (err) => {
                    console.error(err.message)
                  })
                }
              }
            })
          })
      }
      .width('100%')
      //.height('100%')
      //.justifyContent(FlexAlign.Start)


    }
    .height('100%')
  }
}