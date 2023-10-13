# 雙系統修復
```
按下 Steam + X 可召喚螢幕小鍵盤。
```

## 適用範圍
- 被 SteamOS/Windows 更新搞壞的
- 被 Windows 更新搞壞的
- Windows BCD 開機錯誤 `0xc000000f`
## 使用方法
1. 進入 SteamOS 的桌面模式。
2. 開啟 Firefox，輸入 `github.com/xTaiwanPingLord/SD_fix` 打開此網頁。
3. 點左下角開始菜單，System 裡面打開 `Konsole`
4. 在 Konsole 貼上 `git clone github.com/xTaiwanPingLord/SD_fix` 並按下 Enter 執行。（瀏覽器中用觸控板選取起來，L2可以作為右鍵選擇`copy`複製，Konsole的右上角點擊`Paste`貼上）
5. 在 Konsole 貼上以下指令，並按下 Enter 執行。
**可能會要求輸入密碼: `admin`，輸入時不會顯示字元，需要盲打**
```shell
sudo bash SD_fix/fix.sh
```
6. 出現一堆文字後，重開機就會出現系統切換選單
## 
- 切換系統用最左邊十字方向鍵選擇（有些人的機器要先按一下「下」才能選左右）
- 幾秒沒選會自動進steamos
:::

## 進入 Batocera
1. 關閉 Steam Deck。
2. 按住 `音量鍵-`以及`開機鍵`
3. 選擇 `EFI SD/MMC Card (或你的SD卡名字)`。![](https://hackmd.io/_uploads/Sy4WhYIl6.png)

## 出現密碼錯誤／設定密碼
### 狀況描述
輸入指令時出現
- Sorry, try again.
- sudo: 3 incorrect password attempts.
### 解決方法
1. 開機進入 SteamOS 之後，按住 `開機鍵` 點擊 `切換至桌面` 以進入 `桌面模式`
2. 點左下角開始菜單，System 裡面打開 `Konsole`
3. 在 Konsole 輸入 `passwd` 並按下 Enter 執行。
4. 若要求輸入目前的密碼，請重設密碼。若無，此時請輸入想設定的密碼，**輸入時不會顯示字元，需要盲打**，按下 Enter 後再輸入一次（確認用），再按下 Enter。此後任何帶 `sudo` 的指令都要使用這個密碼，請勿忘記。

### 重設密碼
請先嘗試用「變更帳戶」登出再重新登入。
如果上面的方法失效，請在SteamOS的設定內按「重設此機器」。