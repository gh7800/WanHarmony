class StringUtil{
  isEmpty(str : string | null | undefined) : boolean{
    return str && str.trim() == ''
  }

  isNotEmpty(str : string | null | undefined) : boolean{
    return !!str && str.trim() !== ''
  }


}
const stringUtil = new StringUtil()
export default stringUtil