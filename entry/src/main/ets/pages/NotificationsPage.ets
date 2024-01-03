import { PullToRefresh } from '@ohos/pulltorefresh/src/main/ets/components/PullToRefresh/PullToRefresh'
import {
  PullToRefreshConfigurator
} from '@ohos/pulltorefresh/src/main/ets/components/PullToRefresh/PullToRefreshConfigurator'
import api from '../http/Api'
import ApiResponse from '../http/ApiRsponse'
import NotificationModel from '../model/NotificationModel'
import toastUtil from '../utils/ToastUtil'
import { TitleBarComponent } from '../view/TitleBarComponent'

@Entry
@Component
struct NotificationsPage {
  @State data: Array<NotificationModel> = null
  private scroller = new Scroller()
  private page = 1
  @State isRefresh : boolean = false
  private refreshConfig = new PullToRefreshConfigurator()
    .setRefreshColor('#ffcb3d3d')

  aboutToAppear() {
    this.getData()
  }

  private getData() {
    var params = {
      page: this.page
    }
    api.get('api/notice/message', params)
      .then((result: ApiResponse<Array<NotificationModel>>) => {
        if (result.pagination.current_page > 1) {
          result.data.map((value, index) => {
            this.data.push(value)
          })
          if (result.pagination.current_page >= this.page) {
            //this.refreshConfig.setHasLoadMore(false)
          }
        } else {
          this.data = result.data
        }
      })
      .catch(error => {
        toastUtil.show(error)
      })
      .finally(()=>{
        this.isRefresh = true
      })
  }

  @Builder
  refreshView() {
    List({ space: 10, scroller: this.scroller }) {
      ForEach(this.data, (item: NotificationModel, index: number) => {
        ListItem() {
          Column() {
            Text('标题：' + item.title)
              .maxLines(1)
              .width('100%')
              .textAlign(TextAlign.Start)
              .fontColor($r('app.color.c3'))
            Text('内容：' + item.content)
              .maxLines(1)
              .width('100%')
              .textAlign(TextAlign.Start)
              .fontColor($r('app.color.c6'))
            Text('创建时间：' + item.created_at).width('100%').textAlign(TextAlign.End).fontColor($r('app.color.c6'))
          }
        }
        .border({ radius: 5 })
        .padding({ top: 5, left: 5, right: 5, bottom: 5 })
        .backgroundColor($r('app.color.ff'))
      })
    }
    .layoutWeight(1)
    .height('100%')
    .margin({ left: 10, right: 10 })
    .edgeEffect(EdgeEffect.None) // 必须设置列表为滑动到边缘无效果
  }

  build() {
    Column() {
      TitleBarComponent({ title: '通知', menu: '更多' })

      PullToRefresh({
        data: $data,
        refreshConfigurator: this.refreshConfig,
        scroller: this.scroller,
        customList: () => this.refreshView(),
        onRefresh: () => {
          return new Promise((resolve, reject) => {
            this.data = null

            this.page = 1
            this.getData()
            if (this.isRefresh) {
              resolve('加载成功')
            }
          })
        },
        onLoadMore: () => {
          return new Promise((resolve, reject) => {
            this.page++
            this.getData()
            if (this.isRefresh) {
              resolve('加载成功')
            }
          })
        },
        customLoad: null,
        customRefresh: null
      }
      )
        .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.f2'))
    .justifyContent(FlexAlign.Start)
  }
}