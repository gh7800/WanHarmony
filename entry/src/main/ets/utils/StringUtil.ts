class StringUtil{
  isEmpty(str : string | null | undefined) : boolean{
    return str && str.trim() == ''
  }

  isNotEmpty(str : string | null | undefined) : boolean{
    return !!str && str.trim() !== ''
  }

  replaceStr(str : string,p : string ,p1 : string = '') : string{
    str.replace(p,p1)
    return
  }

}
const stringUtil = new StringUtil()
export default stringUtil