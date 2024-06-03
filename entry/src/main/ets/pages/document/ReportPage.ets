import { TitleBarComponent } from '../../view/TitleBarComponent'

@Entry
@Component
struct ReportPage {
  build() {
    Column(){
      TitleBarComponent({title: '请示报告'})


    }
  }
}