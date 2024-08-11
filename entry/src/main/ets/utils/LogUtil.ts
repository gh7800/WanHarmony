import hilog from '@ohos.hilog'
import stringUtil from './StringUtil'
class LogUtil {
  error(msg: string | number | boolean) {
    var str = msg + ''
    str = stringUtil.replaceStr(str,'/','-')
    //console.error(str)
    hilog.error(0x0000, 'Tag', '%{public}s', str + '');
  }

  errorAny(msg : any){
    console.error(msg)
  }

  errorJson(json : any){
    //console.error(JSON.stringify(tag))
    hilog.error(0x0000, 'JSON', '%{public}s', JSON.stringify(json) ?? '');
  }

  info(tag : string,msg : any){
    hilog.error(0x0000, tag, '%{public}s', msg);
  }


}
const logUtil = new LogUtil()
export default logUtil

