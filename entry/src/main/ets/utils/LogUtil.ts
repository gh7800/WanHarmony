class LogUtil {
  error(msg: string | number | boolean) {
    console.error(msg + '')
  }

  err(tag : string,msg : any){
    console.error(tag,msg)
  }

  info(tag : string,msg : any){
    console.error(tag,msg)
  }


}
const logUtil = new LogUtil()
export default logUtil

