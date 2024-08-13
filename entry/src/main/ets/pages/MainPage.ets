import { TitleBarComponent } from '../view/TitleBarComponent';
import { HomePage } from './HomePage'
import { MinePage } from './MinePage'

@Entry
@Component
struct MainPage {
  tabsController: TabsController = new TabsController();
  @State currentIndex: number = 0
  private tabTitles : string[] = ['首页','通讯录','工作','我的']
  @State title: string = this.tabTitles[0]

  //自定义tab
  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex == targetIndex ? selectedImg : normalImg)
        .size({ height: 25, width: 25 })
        .margin({ top: 5 })
      Text(title).fontSize(14).margin({ bottom: 2,top : 2})
    }
    .width(100)
    .height(76)
    .onClick(() => {
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(targetIndex) //切换页面
    })
  }

  build() {
    Column() {
      TitleBarComponent({ title: this.title, isNeedBack: false })

      Tabs({
        barPosition: BarPosition.End,
        controller: this.tabsController
      }) {
        TabContent() {
          HomePage() //@Link 使用$
        }
        .tabBar(this.TabBuilder('首页', 0, $r('app.media.ic_home_selected'), $r('app.media.ic_home_normal')))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('通讯录', 1, $r('app.media.icon_home_contract'), $r('app.media.ic_mine_normal')))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('工作', 2, $r('app.media.ic_mine_selected'), $r('app.media.ic_mine_normal')))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('我的', 3, $r('app.media.ic_mine_selected'), $r('app.media.ic_mine_normal')))


      }
      .barWidth('100%')
      .barHeight(50)
      .layoutWeight(1)
      .onChange((index) => {
        this.currentIndex = index
        this.title = this.tabTitles[index]
      })
    }
    .width('100%')
  }
}