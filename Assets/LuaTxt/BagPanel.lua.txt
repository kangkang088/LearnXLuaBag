BasePanel:subClass("BagPanel")

--[[BagPanel.panelObj = nil

BagPanel.toggleEquip = nil
BagPanel.toggleItem = nil
BagPanel.toggleGem = nil
BagPanel.scrollView = nil


BagPanel.btnClose = nil]]
--
BagPanel.content = nil

--存储当前显示的格子
BagPanel.Items = {}

BagPanel.NowType = -1

function BagPanel:Init(name)
    self.base.Init(self, name)
    if self.IsInitEvent == false then
        self.content = self:GetControl("SVBK", "ScrollRect").transform:Find("Viewport"):Find("Content")

        self:GetControl("ButtonClose", "Button").onClick:AddListener(function()
            self:HideMe()
        end)

        self:GetControl("ToggleEquip", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(1)
            end
        end)
        self:GetControl("ToggleItem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(2)
            end
        end)
        self:GetControl("ToggleGem", "Toggle").onValueChanged:AddListener(function(value)
            if value == true then
                self:ChangeType(3)
            end
        end)

        self.IsInitEvent = true
    end
end

function BagPanel:ShowMe(name)
    self.base.ShowMe(self, name)
    
    if self.NowType == -1 then
        self:ChangeType(1)
    end
end

--[[function BagPanel:HideMe()
    self.panelObj:SetActive(false)
end]]
--

--1-装备，2-道具，3-宝石
function BagPanel:ChangeType(type)
    if self.NowType == type then
        return
    end
    self.NowType = type
    for i = 1, #self.Items do
        --销毁格子对象
        self.Items[i]:Destroy()
    end
    self.Items = {}

    --print("当前类型为："..type)
    --切换页签，展现格子
    local nowItems = {}
    if type == 1 then
        nowItems = PlayerData.equips
    elseif type == 2 then
        nowItems = PlayerData.items
    else
        nowItems = PlayerData.gems
    end

    for i = 1, #nowItems do
        local grid = ItemGrid:new()
        grid:Init(self.content, (i - 1) % 4 * 175, math.floor((i - 1) / 4) * 175)
        grid:InitData(nowItems[i])
        table.insert(self.Items, grid)
    end
end
