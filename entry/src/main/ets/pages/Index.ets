@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)

        Divider().height(10).color(Color.Black) //分割线

        Text($r('app.string.app_name'))
          .fontSize(22)
          .fontWeight(FontWeight.Bold)

        Image($r('app.media.icon'))
          .alt('icon.png')
          .margin(30)
          .width(100)
          .height(100)
      }
      .width('100%')
    }
    .height('100%')
  }
}