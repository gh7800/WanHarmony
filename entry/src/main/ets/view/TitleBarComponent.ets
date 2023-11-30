@Preview
@Component
export struct TitleBarComponent {
  title: string = ''
  menu ?: string = ''

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(30)
        .height(30)

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
        .onClick((event) => {
          this.clickMenu()
        })

    }
    .width('100%')
    .height(56)
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.main'))
  }

  private clickMenu() {

  }
}