# Nextcloud_Notification

### 前言

nextcloud木有提供occ批量发送通知给用户的功能，只能一个个手动输入然后发送，很是gg。

由此自己写一个简单的shell小脚本，纪念一下人生中第一个正常的.sh（gucci）。

注：这里nextcloud使用环境为docker。



### 实现功能

- 输入容器名，可以自动匹配容器ID。
- 自动获取用户列表。
- 批量发送公告（notifications不是announcement，announcement官方有插件，但不会右上角红点提示，只会发送邮件通知用户已公告）。



### 注意事项

- 通知会发送给全体用户（不按组，就是全体用户）。
- 由于occ限制，公告标题最长255字，正文最长4000字。
- 只能输入长文本，多行文本暂不支持。



### 引用来源

原Admin Notifications项目：https://github.com/nextcloud/admin_notifications

