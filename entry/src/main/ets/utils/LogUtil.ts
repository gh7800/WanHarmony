class LogUtil {
  error(msg: string) {
    console.error(msg)
  }

  info(tag : string,msg : any){
    console.error(tag,msg)
  }
}
const logUtil = new LogUtil()
export default logUtil

