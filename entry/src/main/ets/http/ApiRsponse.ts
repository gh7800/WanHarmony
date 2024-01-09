// API 响应的数据结构
import { PaginationModel } from '../model/PaginationModel';
export default class ApiResponse<T = any> {
  data: T;
  success: boolean;
  message: string;
  pagination : PaginationModel = null;

  constructor(success : boolean,data : T,message : string) {
    if(!success){
      throw new Error(message)
    }
  }
}