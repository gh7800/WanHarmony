import stringUtil from './StringUtil'
class LogUtil {
  error(msg: string | number | boolean) {
    var str = msg + ''
    str = stringUtil.replaceStr(str,'/','-')
    console.error(str)

  }

  errorAny(tag : string,msg : any){
    console.error(tag,msg)
  }

  errorJson(tag : any){
    console.error(JSON.stringify(tag))
  }

  info(tag : string,msg : any){
    console.error(tag,msg)
  }


}
const logUtil = new LogUtil()
export default logUtil

