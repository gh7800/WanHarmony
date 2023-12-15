
/**
 * @file 日期工具
 */

const NINE: number = 9; // 这是数字9

class DateTimeUtil {
  /**
   * 时分秒
   */
  getTime(): string {
    const DATETIME = new Date();
    return this.concatTime(
      DATETIME.getHours(),
      DATETIME.getMinutes(),
      DATETIME.getSeconds()
    );
  }

  /**
   * 年月日
   */
  getDate(): string {
    const DATETIME = new Date();
    return this.concatDate(
      DATETIME.getFullYear(),
      DATETIME.getMonth() + 1,
      DATETIME.getDate()
    );
  }

  /**
   * 日期不足两位补充0
   * @param value-数据值
   */
  fill(value: number): string {
    return (value > NINE ? '' : '0') + value;
  }

  /**
   * 年月日格式修饰
   * @param year
   * @param month
   * @param date
   */
  concatDate(year: number, month: number, date: number): string {
    return `${year}${this.fill(month)}${this.fill(date)}`;
  }

  /**
   * 时分秒格式修饰
   * @param hours
   * @param minutes
   * @param seconds
   */
  concatTime(hours: number, minutes: number, seconds: number): string {
    return `${this.fill(hours)}${this.fill(minutes)}${this.fill(seconds)}`;
  }
}

const dateTimeUtil = new DateTimeUtil()
export default dateTimeUtil