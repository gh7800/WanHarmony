import data from '@ohos.telephony.data'
import RefreshAnimHeader from '../view/RefreshAnimHeader'
import { PullToRefresh, PullToRefreshConfigurator } from '@ohos/pulltorefresh'
import router from '@ohos.router'

@Entry
@Component
export struct MinePage {
  @State message: string = '我的'
  private list = ['账号', '名称', '通知', '积分', '设置']
  @State isRefreshing: boolean = false
  private scroller: Scroller = new Scroller();
  @State data: string[] = this.list
  private pullToRefreshConfigurator = new PullToRefreshConfigurator();

  build() {
    Row() {
      Column() {
        PullToRefresh({
          data: $data,
          scroller: this.scroller,
          //refreshConfigurator:this.pullToRefreshConfigurator,
          customList: () => {
            this.getListView()
          },
          onRefresh: () => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                resolve("刷新成功")

              }, 2000)
            })
          },
          customLoad: null,
          customRefresh: null
        })

      }
      .width('100%')
      .height('100%')

    }
    .height('100%')
  }

  @Builder
  private getListView() {

    Row() {
      Button('鸿')
        .fontSize(50)
        .borderRadius('5')
        .width(78)
        .height(78)
        .type(ButtonType.Normal)
        .backgroundColor($r('app.color.black'))
        .margin({ left: 10, top: 5 })
        .onClick((() => {
          this.isRefreshing = !this.isRefreshing
        }))

      Column() {
        Text('名称')
          .fontSize(18)
          .fontColor($r('app.color.c3'))
          .margin({ top: 10 })

        Text('职位---')
          .fontSize(16)
          .fontColor($r('app.color.c6'))
          .margin({ bottom: 5 })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Start)
      .height(88)
      .padding({ left: 10 })
    }
    .width('90%')
    .backgroundColor($r('app.color.f2'))
    .margin({ top: 15, bottom: 10 })
    .borderRadius(8)
    .padding({ top: 5, bottom: 10 })

    List({ space: 15, scroller: this.scroller }) {
      ForEach(this.list, (item: string, index: number) => {
        ListItem() {
          Row() {
            Image($r('app.media.ic_home'))
              .width(22)
              .height(22)
              .margin({ left: 10 })
            Text(item)
              .layoutWeight(1)
              .margin({ left: 10 })
              .fontSize(16)
            Image($r('app.media.ic_enter'))
              .width(40)
              .height(40)
              .margin({ right: 10 })
          }
          .backgroundColor($r('app.color.f2'))
          .borderRadius(8)
          .padding({ top: 5, bottom: 5 })
        }.onClick(() => {
          var it = this.data[index]
          switch (it) {
            case "设置":
              router.pushUrl({url:'pages/SettingPage',params:{
                name:'设置'
              }})
              break
            case '积分':
              break
            default:
              break
          }
        })
      })
    }
    .width('90%')
    .alignListItem(ListItemAlign.Center)
    .edgeEffect(EdgeEffect.None) //必须设置列表滑动到边缘无效果

  }
}