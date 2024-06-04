BasePanel:subClass("MainPanel")
--[[MainPanel.panelObj = nil
MainPanel.btnRole = nil
MainPanel.btnSkill = nil]]--

--实例化面板对象
--处理点击等逻辑

--初始化面板 实例化对象，监听事件
function MainPanel:Init(name)
    self.base.Init(self, name)
    if self.IsInitEvent == false then
        print(self:GetControl("ButtonRole", "Image"))
        self:GetControl("ButtonRole", "Button").onClick:AddListener(function()
            self:ButtonRoleClick()
        end)
        self.IsInitEvent = true
    end
end

--[[function MainPanel:ShowMe()
    self:Init()
    self.panelObj:SetActive(true)
end

function MainPanel:HideMe()
    self.panelObj:SetActive(false)
end]]
      --

function MainPanel:ButtonRoleClick()
    --print("123123")
    BagPanel:ShowMe("BagPanel")
end
