print("准备就绪")
--初始化类别名
require("InitClass")
--初始化道具表信息
require("ItemData")
--初始化玩家信息
require("PlayerData")
PlayerData:Init()
--面板相关
require("BasePanel")
require("MainPanel")
require("BagPanel")
require("ItemGrid")

MainPanel:ShowMe("MainPanel")
