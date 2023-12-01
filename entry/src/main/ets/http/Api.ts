import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse } from '@ohos/axios';

// 创建一个接口用于定义 API 响应的数据结构
interface ApiResponse<T = any> {
  data: T;
  errorCode: number;
  errorMsg: string;
}

// 创建一个自定义的 HTTP 客户端类
class Api {
  private axiosInstance: AxiosInstance;

  constructor() {
    this.axiosInstance = axios.create({
      // 在这里可以添加自定义配置，如 baseURL、headers 等
      baseURL: 'https://www.wanandroid.com',
      timeout: 30000,
      headers: {
        'Content-Type': 'application/json',
      }
    });

    // 添加请求拦截器
    this.axiosInstance.interceptors.request.use(
      config => {
        console.log("Request Config：",config.baseURL + config.url)
        return config
      },
      error => {
        return Promise.reject(error)
      }
    );

    // 添加响应拦截器
    this.axiosInstance.interceptors.response.use(
      response => {
        console.log("Response Data：",response.status)
        return response
        // return this.handleResponse(response)
      },
      error => {
        return this.handleError(error)
      }
    );
  }

  // 发送 GET 请求
  public get<T = any>(url: string, config?: AxiosRequestConfig): Promise<T> {
    return this.axiosInstance.get<ApiResponse<T>>(url, config)
      .then(response => response.data.data)
      .catch(this.handleError);
  }

  // 发送 POST 请求
  public post<T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<T> {
    return this.axiosInstance.post<ApiResponse<T>>(url, data, config)
      .then(response => response.data.data)
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
