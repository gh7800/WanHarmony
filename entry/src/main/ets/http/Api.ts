import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import ApiResponse from './ApiRsponse';


// 创建一个自定义的 HTTP 客户端类
class Api {
  private axiosInstance: AxiosInstance;

  constructor() {
    this.axiosInstance = axios.create({
      // 在这里可以添加自定义配置，如 baseURL、headers 等
      baseURL: 'https://wanandroid.com',
      timeout: 5000,
      headers: {
        'Content-Type': 'application/json',
      },
    });

    // 添加请求拦截器
    this.axiosInstance.interceptors.request.use(
      config => {
        //可添加token等

        console.log("Request Config：",config.method + '___' + config.baseURL + config.url)

        console.log('Request params：',config.params)

        return config
      },
      error => {
        return Promise.reject(error)
      }
    );

    // 添加响应拦截器
    /*this.axiosInstance.interceptors.response.use(
      response => {
        // 在这里添加你的逻辑，例如处理响应数据

        console.log("Response Data：", response.data)
        return this.handleResponse(response)
        // return this.handleResponse(response)
      },
      error => {
        return this.handleError(error)
      }
    );*/
  }

  // 发送 GET 请求
  public async get<ApiResponse>(url: string, config?: AxiosRequestConfig): Promise<ApiResponse> {
    return await this.axiosInstance.get<ApiResponse>(url, config)
      .then(response => response.data)
      .catch(this.handleError);
  }

  // 发送 POST 请求
  public async  post(url: string, data?: any): Promise<ApiResponse> {
    console.log('username',data?.['username'])

    return await this.axiosInstance.post<ApiResponse>(url, data )
      .then(response => response.data)
      .catch(this.handleError);
  }

  // 其他 HTTP 请求方法可以根据需要添加，如 put、delete 等

  // 处理响应拦截
  private handleResponse<T>(response: AxiosResponse<T> | null): T {
    // 检查响应对象是否存在

    if (response && response.data !== undefined && response.data !== null) {
      return response.data;
    } else {
      // 如果响应对象或响应体不存在，返回一个默认值或者抛出错误，根据需要调整
      throw new Error('Invalid response or empty response body');
    }
  }

  // 处理请求错误
  private handleError(error: any): Promise<never> {
    // 这里可以添加一些全局的错误处理逻辑
    return Promise.reject(error);
  }
}

// 创建实例，这样你可以在应用的其他地方使用同一个实例
const api = new Api();

export default api;
