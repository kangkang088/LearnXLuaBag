Object:subClass("BasePanel")

BasePanel.panelObj = nil

BasePanel.IsInitEvent = false

--控件容器，模拟字典，键为控件名，值为控件
BasePanel.controls = {}

function BasePanel:Init(name)
    if self.panelObj == nil then
        self.panelObj = ABMgr:LoadRes("ui", name, typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas, false)

        --为了避免找无用的控件，定义一个命名规则，
        --Button：Button名字
        --Image：Img名字
        --Toggle：Toggle名字
        --Text：Text名字
        --ScrollRect：SV名字
        local allControls = self.panelObj:GetComponentsInChildren(typeof(UIBehaviour))
        for i = 0, allControls.Length - 1 do
            local controlName = allControls[i].name
            if string.find(controlName, "Button") ~= nil or
                string.find(controlName, "Toggle") ~= nil or
                string.find(controlName, "Img") ~= nil or
                string.find(controlName, "SV") ~= nil or
                string.find(controlName, "Text") ~= nil then
                local typeName = allControls[i]:GetType().Name
                if self.controls[allControls[i].name] ~= nil then
                    self.controls[allControls[i].name][typeName] = allControls[i]
                else
                    self.controls[allControls[i].name] = { [typeName] = allControls[i] }
                end
            end
        end
    end
end

function BasePanel:GetControl(name, typeName)
    if self.controls[name] ~= nil then
        local sameControls = self.controls[name]
        if sameControls[typeName] ~= nil then
            return sameControls[typeName]
        end
    end
    return nil
end

function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObj:SetActive(true)
end

function BasePanel:HideMe()
    self.panelObj:SetActive(false)
end
