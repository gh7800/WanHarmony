import router from '@ohos.router'

// 自定义titleBar组件
@Preview
@Component
export struct TitleBarComponent {
  @Prop title: string
  @State menu ?: string = ''
  clickBack: () => void //back
  clickMenu: () => void //右侧menu点击事件回调

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(30)
        .height(30)
        .margin({ left: 10 })
        .onClick(() => {
          if (this.clickBack) {
            this.clickBack()
          } else {
            router.back()
          }
        })

      Text(this.title)
        .fontSize(16)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Text(this.menu)
        .fontSize(16)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Bold)
        .margin({ right: 20 })
        .onClick(() => {
          this.clickMenu()
        })

    }
    .width('100%')
    .height(56)
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.main'))
  }
}

