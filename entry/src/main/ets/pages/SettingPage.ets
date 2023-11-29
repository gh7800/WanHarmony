import router from '@ohos.router'

@Entry
@Component
struct SettingPage {
  private params = router.getParams()
  private name = this.params?.['name']

  build() {
    Row() {
      Column() {
        Text(this.name)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }

  private getData() {

  }
}