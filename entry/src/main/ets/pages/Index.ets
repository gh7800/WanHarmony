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

        Divider() //分割线

        Text("HarmonyOS")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)

      }
      .width('100%')
    }
    .height('100%')
  }
}