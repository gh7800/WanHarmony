import { TitleBarComponent } from '../view/TitleBarComponent';
import { HomePage } from './HomePage'
import { MinePage } from './MinePage'
import { ContactPage } from './contact/ContactPage'
import {WorkingPage} from './working/WorkingPage'

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
        .size({ height: 26, width: 22 })
        // .margin({ top: 2 })
      Text(title)
        .fontColor(this.currentIndex == targetIndex ? $r('app.color.main') : $r('app.color.c6'))
        .fontSize(14)
        .margin({ bottom: 2,top : 2})
    }
    .width(100)
    .height('100%')
    .backgroundColor($r('app.color.write'))
    .justifyContent(FlexAlign.Center)
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
        .tabBar(this.TabBuilder('首页', 0, $r('app.media.home_pressed'), $r('app.media.home_normal')))

        TabContent() {
          ContactPage()
        }
        .tabBar(this.TabBuilder('通讯录', 1, $r('app.media.contact_pressed'), $r('app.media.contact_normal')))

        TabContent() {
          WorkingPage()
        }
        .tabBar(this.TabBuilder('工作', 2, $r('app.media.backlog_pressed'), $r('app.media.backlog_normal')))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBuilder('我的', 3, $r('app.media.mine_pressed'), $r('app.media.mine_normal')))


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