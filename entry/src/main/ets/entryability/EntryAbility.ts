import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {

  //1、最先执行
  onCreate(want, launchParam) {
    console.error("onCreate")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  //2、
  onWindowStageCreate(windowStage: window.WindowStage) {
    console.error("onWindowStageCreate")
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  //3、在前台
  onForeground() {
    console.error("onForeground")
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    console.error("onBackground")
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onWindowStageDestroy() {
    console.error("onWindowStageDestroy")
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onDestroy() {
    console.error("onDestroy")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }
}
