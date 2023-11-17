import router from '@ohos.router'
import hilog from '@ohos.hilog'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column(
        {
          space: 10, //组件之间的间距
        }
      ) {
        /*Text(this.message)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)*/

        //Divider().height(10).color(Color.Black) //分割线


        Image($r('app.media.icon'))
          .width(100)
          .height(100)

        Text("鸿蒙OS")
          .fontSize(22)
          .margin({ top: 10 })
          .fontWeight(FontWeight.Bold)

        Button('开始体验', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(20)
          .margin({ top: 30 })
          .width(150)
          .onClick(() => {
            router.pushUrl({url:'pages/LoginIndex'},router.RouterMode.Single,(err)=>{ //关闭当前页并打开新的页面
              console.error(err.message)
            })
          })
      }
      .width('100%')
      .padding(22)
      //.backgroundColor(Color.Pink)

    }
    .height('100%')
    .alignItems(VerticalAlign.Bottom)
    .padding({ bottom: 100 })
  }
}