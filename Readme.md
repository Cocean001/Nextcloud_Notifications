# Nextcloud_Notification

## 前言

nextcloud木有提供occ批量发送通知给用户的功能，只能一个个手动输入然后发送，很是gg。

由此自己写一个简单的shell小脚本，纪念一下人生中第一个正常的.sh（gucci）。

注：这里nextcloud使用环境为docker。



## 实现功能

- 输入容器名，可以自动匹配容器ID。
- 自动获取用户列表。
- 批量发送公告（notifications不是announcement，announcement官方有插件，但不会右上角红点提示，只会发送邮件通知用户已公告）。



## 注意事项

- 通知会发送给全体用户（不按组，就是全体用户）。
- 由于occ限制，公告标题最长255字，正文最长4000字。
- 只能输入长文本，多行文本暂不支持。



## 引用来源

原Admin Notifications项目：https://github.com/nextcloud/admin_notifications



## 图

#### 正常无通知状态

![截屏2020-09-11 22.53.20](Readme.assets/%E6%88%AA%E5%B1%8F2020-09-11%2022.53.20.png)

#### shell面板



#### ![截屏2020-09-11 22.54.28](Readme.assets/%E6%88%AA%E5%B1%8F2020-09-11%2022.54.28-9842482.png)

#### 发布通知后，刷新页面，右上角自动显示通知，手机app自动推送（需开启消息推送功能）。

![截屏2020-09-11 22.54.46](Readme.assets/%E6%88%AA%E5%B1%8F2020-09-11%2022.54.46-9842346.png)

![截屏2020-09-11 22.54.55](Readme.assets/%E6%88%AA%E5%B1%8F2020-09-11%2022.54.55.png)

![IMG_6043](Readme.assets/IMG_6043.jpg)

