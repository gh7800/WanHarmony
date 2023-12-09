/**
 * 自定义-LoadingDialog
 */

@Preview
@CustomDialog
export default struct LoadingDialog {
  controller : CustomDialogController

  build() {
    Column() {
      LoadingProgress()
        .color($r('app.color.main'))
        .height(60)

      Text('加载中..')
        .margin({ top: 0,bottom:10 })
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
    .borderRadius(6)
  }
}